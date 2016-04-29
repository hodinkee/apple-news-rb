module AppleNews
  module Component
    module Text
      extend ActiveSupport::Concern

      included do
        required_property :text
        optional_properties :anchor, :animation, :behavior, :format,
                            :inlineTextStyles, :textStyle

        optional_property :anchor, nil, Property::Anchor
        optional_property :animation, nil, Animation, :factory
      end
    end
  end
end
