module AppleNews
  module Style
    class VideoFill < Base
      required_property :type, "video"
      required_properties :url, :still_url
      optional_properties :fill_mode, :loop, :vertical_alignment, :horizontal_alignment

      property_inflection :url, 'URL'
      property_inflection :still_url, 'stillURL'
    end
  end
end
