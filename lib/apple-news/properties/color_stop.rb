module AppleNews
  module Property
    class ColorStop < Base
      required_property :color
      optional_properties :location
    end
  end
end
