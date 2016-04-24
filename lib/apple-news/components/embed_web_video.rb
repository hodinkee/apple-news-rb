module AppleNews
  module Component
    class EmbedWebVideo < Base
      role "embedwebvideo"
      required_property :url
      optional_properties :accessibility_caption, :aspect_ratio, :caption,
                          :explicit_content
                          
      property_inflection :url, 'URL'
    end
  end
end
