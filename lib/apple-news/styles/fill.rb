module AppleNews
  module Style
    module Fill
      extend ActiveSupport::Concern

      included do
        optional_property :attachment
      end
    end
  end
end
