module AppleNews
  module Component
    module Audio
      extend ActiveSupport::Concern

      included do
        role "audio"
        required_property :url
        optional_properties :accessibility_caption, :caption, :explicit_content, :image_url
      end
    end
  end
end
