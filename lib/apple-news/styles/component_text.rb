module AppleNews
  module Style
    class ComponentText < Text
      optional_properties :drop_cap_style, :first_line_indent, :hanging_punctuation, :hyphenation,
                          :line_height, :link_style, :paragraph_spacing_before, :paragraph_spacing_after,
                          :text_alignment
    end
  end
end
