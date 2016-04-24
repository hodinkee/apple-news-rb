module AppleNews
  module Component
    module Text
      extend ActiveSupport::Concern

      included do
        required_property :text
        optional_properties :anchor, :animation, :behavior, :format,
                            :identifier, :inlineTextStyles, :layout,
                            :style, :textStyle
      end
    end
  end
end
