module AppleNews
  module Addition
    class Link < Base
      type "link"
      required_properties :range_length, :range_start, :url
      property_inflection :url, 'URL'
    end
  end
end
