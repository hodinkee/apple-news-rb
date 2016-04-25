module AppleNews
  module Property
    class GalleryItem < Base
      optional_properties :url, :caption, :accessibility_caption, :explicit_content
    end
  end
end
