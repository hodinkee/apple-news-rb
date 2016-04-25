module AppleNews
  module Style
    module GradientFill
      extend ActiveSupport::Concern

      included do
        include Fill
        required_property :color_stops
      end
    end
  end
end
