module AppleNews
  module Component
    class Gallery < Base
      role "gallery"
      required_property :items, [], Property::GalleryItem
    end
  end
end
