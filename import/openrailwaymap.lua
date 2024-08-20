function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function map(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

local railway_line = osm2pgsql.define_table({
  name = 'railway_line',
  ids = { type = 'way', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'linestring' },
    { column = 'railway', type = 'text' },
    -- TODO build feature column
    { column = 'feature', type = 'text' },
    { column = 'service', type = 'text' },
    { column = 'usage', type = 'text' },
    { column = 'highspeed', type = 'boolean' },
    { column = 'layer', type = 'text' },
    { column = 'ref', type = 'text' },
    { column = 'track_ref', type = 'text' },
    { column = 'name', type = 'text' },
    { column = 'construction', type = 'text' },
    { column = 'track_class', type = 'text' },
    { column = 'tunnel', type = 'text' },
    { column = 'tunnel_name', type = 'text' },
    { column = 'bridge', type = 'text' },
    { column = 'bridge_name', type = 'text' },
    { column = 'maxspeed', type = 'text' },
    { column = 'maxspeed_forward', type = 'text' },
    { column = 'maxspeed_backward', type = 'text' },
    { column = 'preferred_direction', type = 'text' },
    { column = 'frequency', type = 'real' },
    { column = 'voltage', type = 'integer' },
    { column = 'electrification_state', type = 'text' },
    { column = 'future_frequency', type = 'real' },
    { column = 'future_voltage', type = 'integer' },
    { column = 'gauges', sql_type = 'text[]' },
    { column = 'reporting_marks', sql_type = 'text[]' },
    { column = 'construction_railway', type = 'text' },
    { column = 'proposed_railway', type = 'text' },
    { column = 'disused_railway', type = 'text' },
    { column = 'abandoned_railway', type = 'text' },
    { column = 'abandoned_name', type = 'text' },
    { column = 'razed_railway', type = 'text' },
    { column = 'razed_name', type = 'text' },
    { column = 'preserved_railway', type = 'text' },
    { column = 'train_protection', type = 'text' },
    { column = 'train_protection_rank', type = 'smallint' },
  },
})

local pois = osm2pgsql.define_table({
  name = 'pois',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'railway', type = 'text' },
    { column = 'man_made', type = 'text' },
    { column = 'crossing_bell', type = 'boolean' },
    { column = 'crossing_light', type = 'boolean' },
    { column = 'crossing_barrier', type = 'boolean' },
  },
})

local stations = osm2pgsql.define_table({
  name = 'stations',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'railway', type = 'text' },
    { column = 'feature', type = 'text' },
    { column = 'name', type = 'text' },
    { column = 'ref', type = 'text' },
    { column = 'station', type = 'text' },
    { column = 'railway_ref', type = 'text' },
    { column = 'uic_ref', type = 'text' },
    { column = 'name_tags', type = 'hstore' },
  },
})

local stop_positions = osm2pgsql.define_table({
  name = 'stop_positions',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'name', type = 'text' },
  },
})

local platforms = osm2pgsql.define_table({
  name = 'platforms',
  ids = { type = 'any', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'name', type = 'text' },
  },
})

local signals = osm2pgsql.define_table({
  name = 'signals',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'railway', type = 'text' },
    { column = 'rank', type = 'smallint' },
    { column = 'deactivated', type = 'boolean' },
    { column = 'ref', type = 'text' },
    { column = 'ref_multiline', type = 'text' },
    { column = 'ref_width', type = 'smallint' },
    { column = 'ref_height', type = 'smallint' },
    { column = 'signal_direction', type = 'text' },
    {% for tag in signals_railway_signals.tags %}
    { column = '{% tag %}', type = 'text' },
{% end %}
    {% for tag in speed_railway_signals.tags %}
    { column = '{% tag %}', type = 'text' },
{% end %}
    {% for tag in electrification_signals.tags %}
    { column = '{% tag %}', type = 'text' },
{% end %}
  },
})

local signal_boxes = osm2pgsql.define_table({
  name = 'signal_boxes',
  ids = { type = 'any', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'geometry' },
    { column = 'way_area', type = 'real' },
    { column = 'ref', type = 'text' },
    { column = 'name', type = 'text' },
  },
})

local turntables = osm2pgsql.define_table({
  name = 'turntables',
  ids = { type = 'way', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'polygon' },
  },
})

local railway_positions = osm2pgsql.define_table({
  name = 'railway_positions',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'railway', type = 'text' },
    { column = 'railway_position', type = 'text' },
    { column = 'railway_position_exact', type = 'text' },
    { column = 'name', type = 'text' },
    { column = 'ref', type = 'text' },
  },
})

local railway_switches = osm2pgsql.define_table({
  name = 'railway_switches',
  ids = { type = 'node', id_column = 'osm_id' },
  columns = {
    { column = 'id', sql_type = 'serial', create_only = true },
    { column = 'way', type = 'point' },
    { column = 'railway', type = 'text' },
    { column = 'ref', type = 'text' },
    { column = 'railway_local_operated', type = 'boolean' },
  },
})

local routes = osm2pgsql.define_table({
  name = 'routes',
  ids = { type = 'relation', id_column = 'osm_id' },
  columns = {
    { column = 'platform_ref_ids', sql_type = 'int8[]' },
    { column = 'stop_ref_ids', sql_type = 'int8[]' },
  },
  indexes = {
    { column = 'platform_ref_ids', method = 'gin' },
    { column = 'stop_ref_ids', method = 'gin' },
  },
})

function train_protection(tags)
  {% for feature in signals_railway_line.features %}
  if {% for tag in feature.tags %}{% unless loop.first %} and{% end %} tags['{% tag.tag %}'] == '{% tag.value %}'{% end %} then return '{% feature.train_protection %}', {% feature.rank %} end
{% end %}

  return nil, 0
end

local electrification_values = osm2pgsql.make_check_values_func({'contact_line', 'yes', 'rail', 'ground-level_power_supply', '4th_rail', 'contact_line;rail', 'rail;contact_line'})
function electrification_state(tags, ignore_future_states)
  local electrified = tags['electrified']

  if electrification_values(electrified) then
    return 'present', tonumber(tags['voltage']), tonumber(tags['frequency'])
  end
  if (not ignore_future_states) and electrification_values(tags['construction:electrified']) then
    return 'construction', tonumber(tags['construction:voltage']), tonumber(tags['construction:frequency'])
  end
  if (not ignore_future_states) and electrification_values(tags['proposed:electrified']) then
    return 'proposed', tonumber(tags['proposed:voltage']), tonumber(tags['proposed:frequency'])
  end
  if electrified == 'no' and electrification_values(tags['deelectrified']) then
    return 'deelectrified', nil, nil
  end
  if electrified == 'no' and electrification_values(tags['abandoned:electrified']) then
    return 'abandoned', nil, nil
  end

  return nil, nil, nil
end

-- TODO clean up unneeded tags

local railway_station_values = osm2pgsql.make_check_values_func({'station', 'halt', 'tram_stop', 'service_station', 'yard', 'junction', 'spur_junction', 'crossover', 'site'})
local railway_poi_values = osm2pgsql.make_check_values_func({'crossing', 'level_crossing', 'phone', 'tram_stop', 'border', 'owner_change', 'radio', 'lubricator'})
local railway_signal_values = osm2pgsql.make_check_values_func({'signal', 'buffer_stop', 'derail', 'vacancy_detection'})
local railway_position_values = osm2pgsql.make_check_values_func({'milestone', 'level_crossing', 'crossing'})
local railway_switch_values = osm2pgsql.make_check_values_func({'switch', 'railway_crossing'})
local known_name_tags = {'name', 'alt_name', 'short_name', 'long_name', 'official_name', 'old_name', 'uic_name'}
function osm2pgsql.process_node(object)
  local tags = object.tags

  if tags.railway == 'signal_box' then
    signal_boxes:insert({
      way = object:as_point(),
      way_area = 0,
      ref = tags['railway:ref'],
      name = tags.name,
    })
  end

  if railway_station_values(tags['railway'])
     or railway_station_values(tags['construction:railway'])
     or railway_station_values(tags['proposed:railway'])
     or railway_station_values(tags['disused:railway'])
     or railway_station_values(tags['abandoned:railway'])
     or railway_station_values(tags['razed:railway'])
     or railway_station_values(tags['preserved:railway'])
   then

    feature = tags['railway']
      or tags['construction:railway']
      or tags['proposed:railway']
      or tags['disused:railway']
      or tags['abandoned:railway']
      or tags['razed:railway']
      or tags['preserved:railway']

    -- Gather name tags for searching
    name_tags = {}
    for key, value in pairs(tags) do
      for _, name_tag in ipairs(known_name_tags) do
        if key == name_tag or (key:find('^' .. name_tag .. ':') ~= nil) then
          name_tags[key] = value
          break
        end
      end
    end

    if tags.station then
      for station in string.gmatch(tags.station, '[^;]+') do
        stations:insert({
          way = object:as_point(),
          railway = tags['railway'],
          feature = feature,
          name = tags.name or tags.short_name,
          ref = tags.ref,
          station = station,
          railway_ref = tags['railway:ref'],
          uic_ref = tags['uic_ref'],
          name_tags = name_tags,
        })
      end
    else
      stations:insert({
        way = object:as_point(),
        railway = tags['railway'],
        feature = feature,
        name = tags.name or tags.short_name,
        ref = tags.ref,
        station = nil,
        railway_ref = tags['railway:ref'],
        uic_ref = tags['uic_ref'],
        name_tags = name_tags,
      })
    end
  end

  if railway_poi_values(tags.railway) then
    pois:insert({
      way = object:as_point(),
      railway = tags.railway,
      man_made = tags.man_made,
      crossing_bell = tags['crossing:bell'] and (tags['crossing:bell'] ~= 'no'),
      crossing_light = tags['crossing:light'] and (tags['crossing:light'] ~= 'no'),
      crossing_barrier = tags['crossing:barrier'] and (tags['crossing:barrier'] ~= 'no'),
    })
  end

  if tags.public_transport == 'stop_position' then
    stop_positions:insert({
      way = object:as_point(),
      railway = tags.railway,
      name = tags.name,
    })
  end

  if tags.public_transport == 'platform' or tags.railway == 'platform' then
    platforms:insert({
      way = object:as_point(),
      name = tags.name,
    })
  end

  if railway_signal_values(tags.railway) then
    local rank = (
      (tags['railway:signal:main'] and 10000) or
      (tags['railway:signal:combined'] and 10000) or
      (tags['railway:signal:distant'] and 9000) or
      (tags['railway:signal:train_protection'] and 8500) or
      (tags['railway:signal:main_repeated'] and 8000) or
      (tags['railway:signal:minor'] and 4000) or
      (tags['railway:signal:passing'] and 3500) or
      (tags['railway:signal:shunting'] and 3000) or
      (tags['railway:signal:stop'] and 1000) or
      (tags['railway:signal:stop_demand'] and 900) or
      (tags['railway:signal:station_distant'] and 550) or
      (tags['railway:signal:crossing'] and 1000) or
      (tags['railway:signal:crossing_distant'] and 500) or
      (tags['railway:signal:ring'] and 500) or
      (tags['railway:signal:whistle'] and 500) or
      (tags['railway:signal:departure'] and 400) or
      (tags['railway:signal:resetting_switch'] and 300) or
      (tags['railway:signal:resetting_switch_distant'] and 200) or
      0
    )
    local deactivated = (
      tags['railway:signal:combined:deactivated'] or
      tags['railway:signal:main:deactivated'] or
      tags['railway:signal:distant:deactivated'] or
      tags['railway:signal:train_protection:deactivated'] or
      tags['railway:signal:main_repeated:deactivated'] or
      tags['railway:signal:minor:deactivated'] or
      tags['railway:signal:passing:deactivated'] or
      tags['railway:signal:shunting:deactivated'] or
      tags['railway:signal:stop:deactivated'] or
      tags['railway:signal:stop_demand:deactivated'] or
      tags['railway:signal:station_distant:deactivated'] or
      tags['railway:signal:crossing_distant:deactivated'] or
      tags['railway:signal:crossing:deactivated'] or
      tags['railway:signal:ring:deactivated'] or
      tags['railway:signal:whistle:deactivated'] or
      tags['railway:signal:departure:deactivated'] or
      tags['railway:signal:main_repeated:deactivated'] or
      tags['railway:signal:humping:deactivated'] or
      tags['railway:signal:speed_limit:deactivated']
    ) == 'yes'
    local ref_multiline, newline_count = (tags.ref or ''):gsub(' ', '\n')
    local ref_height = newline_count + 1
    local ref_width = 0
    for part in string.gmatch(tags.ref or '', '[^ ]+') do
      ref_width = math.max(ref_width, part:len())
    end

    signals:insert({
      way = object:as_point(),
      railway = tags.railway,
      rank = rank,
      deactivated = deactivated,
      ref = tags.ref,
      ref_multiline = ref_multiline ~= '' and ref_multiline or nil,
      ref_height = ref_multiline ~= '' and ref_height or nil,
      ref_width = ref_multiline ~= '' and ref_width or nil,
      signal_direction = tags['railway:signal:direction'],
      {% for tag in signals_railway_signals.tags %}
      ["{% tag %}"] = tags['{% tag %}'],
{% end %}
      {% for tag in speed_railway_signals.tags %}
      ["{% tag %}"] = tags['{% tag %}'],
{% end %}
      {% for tag in electrification_signals.tags %}
      ["{% tag %}"] = tags['{% tag %}'],
{% end %}
    })
  end

  if railway_position_values(tags.railway) and (tags['railway:position'] or tags['railway:position:exact']) then
    railway_positions:insert({
      way = object:as_point(),
      railway = tags.railway,
      railway_position = tags['railway:position'],
      railway_position_exact = tags['railway:position:exact'],
      name = tags['name'],
      ref = tags['ref'],
    })
  end

  if railway_switch_values(tags.railway) and tags.ref then
    railway_switches:insert({
      way = object:as_point(),
      railway = tags.railway,
      ref = tags.ref,
      railway_local_operated = tags['railway:local_operated'] == 'yes',
    })
  end
end

local railway_values = osm2pgsql.make_check_values_func({'rail', 'tram', 'light_rail', 'subway', 'narrow_gauge', 'construction', 'preserved', 'monorail', 'miniature'})
local railway_turntable_values = osm2pgsql.make_check_values_func({'turntable', 'traverser'})
function osm2pgsql.process_way(object)
  local tags = object.tags

  if railway_values(tags.railway) then
    local railway_train_protection, railway_train_protection_rank = train_protection(tags)

    local current_electrification_state, voltage, frequency = electrification_state(tags, true)
    local _, future_voltage, future_frequency = electrification_state(tags, false)

    local gauges = {}
    local gauge_tag = tags['gauge'] or tags['construction:gauge']
    if gauge_tag then
      for gauge in string.gmatch(gauge_tag, '[^;]+') do
        if gauge then
          -- Raw SQL array syntax
          table.insert(gauges, "\"" .. gauge:gsub("\"", "\\\"") .. "\"")
        end
      end
    end

    local reporting_marks = {}
    local reporting_marks_tag = tags['reporting_marks']
    if reporting_marks_tag then
      for reporting_mark in string.gmatch(reporting_marks_tag, '[^;]+') do
        if reporting_mark then
          -- Raw SQL array syntax
          table.insert(reporting_marks, "\"" .. reporting_mark:gsub("\"", "\\\"") .. "\"")
        end
      end
    end

    railway_line:insert({
      way = object:as_linestring(),
      railway = tags['railway'],
      service = tags['service'],
      usage = tags['usage'],
      highspeed = tags['highspeed'] == 'yes',
      layer = tags['layer'],
      ref = tags['ref'],
      track_ref = tags['railway:track_ref'],
      track_class = tags['railway:track_class'],
      name = tags['name'],
      public_transport = tags['public_transport'],
      construction = tags['construction'],
      tunnel = tags['tunnel'],
      tunnel_name = tags['tunnel:name'],
      bridge = tags['bridge'],
      bridge_name = tags['bridge:name'],
      maxspeed = tags['maxspeed'],
      maxspeed_forward = tags['maxspeed:forward'],
      maxspeed_backward = tags['maxspeed:backward'],
      preferred_direction = tags['railway:preferred_direction'],
      electrification_state = current_electrification_state,
      frequency = frequency,
      voltage = voltage,
      future_frequency = future_frequency,
      future_voltage = future_voltage,
      gauges = '{' .. table.concat(gauges, ',') .. '}',
      reporting_marks = '{' .. table.concat(reporting_marks, ',') .. '}',
      construction_railway = tags['construction:railway'],
      proposed_railway = tags['proposed:railway'],
      disused_railway = tags['disused:railway'],
      abandoned_railway = tags['abandoned:railway'],
      abandoned_name = tags['abandoned:name'],
      razed_railway = tags['razed:railway'],
      razed_name = tags['razed:name'],
      preserved_railway = tags['preserved:railway'],
      train_protection = railway_train_protection,
      train_protection_rank = railway_train_protection_rank,
    })
  end

  if tags.public_transport == 'platform' or tags.railway == 'platform' then
    platforms:insert({
      way = object:as_linestring():centroid(),
      name = tags.name,
    })
  end

  if railway_turntable_values(tags.railway) then
    turntables:insert({
      way = object:as_polygon(),
    })
  end

  if tags.railway == 'signal_box' then
    local polygon = object:as_polygon():transform(3857)
    signal_boxes:insert({
      way = polygon,
      way_area = polygon:area(),
      ref = tags['railway:ref'],
      name = tags.name,
    })
  end
end

local route_values = osm2pgsql.make_check_values_func({'train', 'subway', 'tram', 'light_rail'})
local route_stop_relation_roles = osm2pgsql.make_check_values_func({'stop', 'station', 'stop_exit_only', 'stop_entry_only', 'forward_stop', 'backward_stop', 'forward:stop', 'backward:stop', 'stop_position', 'halt'})
local route_platform_relation_roles = osm2pgsql.make_check_values_func({'platform', 'platform_exit_only', 'platform_entry_only', 'forward:platform', 'backward:platform'})
function osm2pgsql.process_relation(object)
  local tags = object.tags

  if tags.type == 'route' and route_values(tags.route) then
    local stop_members = {}
    local platform_members = {}
    for _, member in ipairs(object.members) do
      if route_stop_relation_roles(member.role) then
        table.insert(stop_members, member.ref)
      end

      if route_platform_relation_roles(member.role) then
        table.insert(platform_members, member.ref)
      end
    end

    if (#stop_members > 0) or (#platform_members > 0) then
      routes:insert({
        stop_ref_ids = '{' .. table.concat(stop_members, ',') .. '}',
        platform_ref_ids = '{' .. table.concat(platform_members, ',') .. '}',
      })
    end
  end
end
