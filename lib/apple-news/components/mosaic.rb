module AppleNews
  module Component
    class Mosaic < Base
      role "mosaic"
      required_property :items, [], GalleryItem
    end
  end
end
