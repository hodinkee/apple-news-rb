module AppleNews
  module Component
    class BannerAdvertisement < Base
      role "banner_advertisement"
      optional_property :banner_type, "any"

      def valid?
        super && [
          'any', 'standard', 'double_height', 'large'
        ].include?(banner_type)
      end
    end
  end
end
