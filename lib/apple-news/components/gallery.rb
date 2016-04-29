module AppleNews
  module Component
    class Gallery < Base
      role "gallery"
      required_property :items, [], GalleryItem
    end
  end
end
