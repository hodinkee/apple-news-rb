module AppleNews
  module Component
    module Text
      extend ActiveSupport::Concern

      included do
        required_property :text
        optional_property :format

        optional_property :anchor, nil, Property::Anchor
        optional_property :animation, nil, Animation, :factory
        optional_property :behavior, nil, Behavior, :factory
        optional_property :inline_text_styles, [], Style::InlineText
        optional_property :text_style, nil, Style::ComponentText
      end
    end
  end
end
