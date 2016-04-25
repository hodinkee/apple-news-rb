module AppleNews
  module Component
    class Tweet < Base
      role "tweet"
      required_property :url
      property_inflection :url, 'URL'
    end
  end
end
