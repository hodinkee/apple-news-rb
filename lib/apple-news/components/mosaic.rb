module AppleNews
  module Component
    class Mosaic < Base
      role "mosaic"
      required_property :items, []
    end
  end
end
