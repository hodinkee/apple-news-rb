module AppleNews
  module Property
    class CaptionDescriptor < Base
      required_property :text
      optional_properties :text_style, :format
      optional_property :inline_text_styles, []
      optional_property :additions, []
    end
  end
end
