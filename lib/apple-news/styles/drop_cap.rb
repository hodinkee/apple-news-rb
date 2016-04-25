module AppleNews
  module Style
    class DropCap < Base
      required_property :number_of_lines
      optional_properties :background_color, :font_name, :number_of_characters, :number_of_raised_lines,
                          :padding, :text_color
    end
  end
end
