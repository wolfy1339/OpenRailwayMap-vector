function filter_tags_way(tags, num_tags)
    if tags["railway"] == "abandoned" and tags["highway"] then
        tags["maxspeed"] = nil
    end
    return tags, num_tags
end
