module AppleNews
  module Component
    class Map < Base
      role "map"
      optional_properties :latitude, :longitude, :caption, :map_type,
                          :span
                          
      optional_properties :items, []
    end
  end
end
