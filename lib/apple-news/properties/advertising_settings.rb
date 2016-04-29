require 'apple-news/properties/advertising_layout'

module AppleNews
  module Property
    class AdvertisingSettings < Base
      optional_property :frequency
      optional_property :layout, nil, Property::AdvertisingLayout
    end
  end
end
