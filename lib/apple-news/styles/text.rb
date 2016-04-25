module AppleNews
  module Style
    class Text < Base
      optional_properties :background_color, :font_name, :font_size, :text_color, :text_shadow,
                          :strikethrough, :stroke, :tracking, :underline, :vertical_alignment
    end
  end
end
