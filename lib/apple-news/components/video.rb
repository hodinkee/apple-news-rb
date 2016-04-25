module AppleNews
  module Component
    class Video < Base
      role "video"
      required_property :url
      optional_properties :accessibility_caption, :aspect_ratio, :explicit_content, :still_url

      property_inflection :url, 'URL'
      property_inflection :still_url, 'stillURL'
    end
  end
end
