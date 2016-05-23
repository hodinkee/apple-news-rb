module AppleNews
  module Component
    class Place < Base
      role "place"

      optional_properties :latitude, :longitude, :caption, :map_type,
                          :span
    end
  end
end
