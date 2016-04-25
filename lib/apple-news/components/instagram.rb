module AppleNews
  module Component
    class Instagram < Base
      role "instagram"
      required_property :url
      property_inflection :url, 'URL'
    end
  end
end
