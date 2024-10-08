from fastapi import HTTPException
from starlette.status import HTTP_400_BAD_REQUEST, HTTP_422_UNPROCESSABLE_ENTITY

QUERY_PARAMETERS =  ['q', 'name', 'ref', 'uic_ref']

class FacilityAPI:
    def __init__(self, database):
        self.database = database

    def eliminate_duplicates(self, data, limit):
        data.sort(key=lambda k: k['osm_id'])
        i = 1
        while i < len(data):
            if data[i]['osm_id'] == data[i - 1]['osm_id']:
                data.pop(i)
            i += 1
        if len(data) > limit:
            return data[:limit]
        return data

    async def __call__(self, *, q, name, ref, uic_ref, limit):
        # Validate search arguments
        search_args_count = sum(1 for search_arg in [q, name, ref, uic_ref] if search_arg)

        if search_args_count > 1:
            args = ', '.join(QUERY_PARAMETERS)
            raise HTTPException(
                HTTP_422_UNPROCESSABLE_ENTITY,
                {'type': 'multiple_query_args', 'error': 'More than one argument with a search term provided.', 'detail': f'Provide only one of the following query parameters: {args}'}
            )
        elif search_args_count == 0:
            args = ', '.join(QUERY_PARAMETERS)
            raise HTTPException(
                HTTP_422_UNPROCESSABLE_ENTITY,
                {'type': 'no_query_arg', 'error': 'No argument with a search term provided.', 'detail': f'Provide one of the following query parameters: {args}'}
            )

        if name:
            return await self.search_by_name(name, limit)
        if ref:
            return await self.search_by_ref(ref, limit)
        if uic_ref:
            return await self.search_by_uic_ref(uic_ref, limit)
        if q:
            return self.eliminate_duplicates((await self.search_by_name(q, limit)) + (await self.search_by_ref(q, limit)) + (await self.search_by_uic_ref(q, limit)), limit)

    def query_has_no_wildcards(self, q):
        if '%' in q or '_' in q:
            return False
        return True

    async def search_by_name(self, q, limit):
        if not self.query_has_no_wildcards(q):
            raise HTTPException(
                HTTP_400_BAD_REQUEST,
                {'type': 'wildcard_in_query', 'error': 'Wildcard in query.', 'detail': 'Query contains any of the wildcard characters: %_'}
            )

        # TODO support filtering on state of feature: abandoned, in construction, disused, preserved, etc.
        # We do not sort the result although we use DISTINCT ON because osm_id is sufficient to sort out duplicates.
        fields = self.sql_select_fieldlist()
        sql_query = f"""SELECT
            {fields}, latitude, longitude, rank
            FROM (
              SELECT DISTINCT ON (osm_id)
                {fields}, latitude, longitude, rank
              FROM (
                SELECT
                    {fields}, ST_X(ST_Transform(geom, 4326)) AS latitude, ST_Y(ST_Transform(geom, 4326)) AS longitude, openrailwaymap_name_rank(phraseto_tsquery('simple', unaccent(openrailwaymap_hyphen_to_space($1))), terms, route_count, railway, station) AS rank
                  FROM openrailwaymap_facilities_for_search
                  WHERE terms @@ phraseto_tsquery('simple', unaccent(openrailwaymap_hyphen_to_space($1)))
                ) AS a
              ) AS b
              ORDER BY rank DESC NULLS LAST
          LIMIT $2;"""

        async with self.database.acquire() as connection:
            statement = await connection.prepare(sql_query)
            async with connection.transaction():
                data = []
                async for record in statement.cursor(q, limit):
                    data.append(dict(record))
                return data

    async def _search_by_ref(self, search_key, ref, limit):
        # We do not sort the result, although we use DISTINCT ON because osm_id is sufficient to sort out duplicates.
        fields = self.sql_select_fieldlist()
        sql_query = f"""SELECT DISTINCT ON (osm_id)
          {fields}, ST_X(ST_Transform(geom, 4326)) AS latitude, ST_Y(ST_Transform(geom, 4326)) AS longitude
          FROM openrailwaymap_ref
          WHERE {search_key} = $1
          LIMIT $2;"""

        async with self.database.acquire() as connection:
            statement = await connection.prepare(sql_query)
            async with connection.transaction():
                data = []
                async for record in statement.cursor(ref, limit):
                    data.append(dict(record))
                return data

    async def search_by_ref(self, ref, limit):
        return await self._search_by_ref("railway_ref", ref, limit)

    async def search_by_uic_ref(self, ref, limit):
        return await self._search_by_ref("uic_ref", ref, limit)

    def sql_select_fieldlist(self):
        return "osm_id, name, railway, railway_ref"
