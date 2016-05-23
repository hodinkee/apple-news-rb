module AppleNews
  module Property
    class MapItem < Base
      required_properties :latitude, :longitude
      optional_property :caption
    end
  end
end
