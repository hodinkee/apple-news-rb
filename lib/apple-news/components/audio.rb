module AppleNews
  module Component
    module Audio
      extend ActiveSupport::Concern

      included do
        role "audio"
        required_property :url
        optional_properties :accessibility_caption, :caption, :explicit_content, :image_url

        property_inflection :url, 'URL'
        property_inflection :image_url, 'imageURL'
      end
    end
  end
end
