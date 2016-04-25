module AppleNews
  module Property
    class CaptionDescriptor < Base
      required_property :text
      optional_properties :text_style, :format, :inline_text_styles, :additions
    end
  end
end
