module AppleNews
  module Style
    class ImageFill < Base
      include Fill
      required_property :type, "image"
      required_property :url
      optional_properties :fill_mode, :horizontal_alignment, :vertical_alignment
      property_inflection :url, 'URL'
    end
  end
end
