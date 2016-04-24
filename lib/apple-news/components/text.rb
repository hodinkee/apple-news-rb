module AppleNews
  module Component
    module Text
      extend ActiveSupport::Concern

      included do
        required_property :text
        optional_properties :anchor, :animation, :behavior, :format,
                            :inlineTextStyles, :textStyle
      end
    end
  end
end
