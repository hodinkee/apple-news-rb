module AppleNews
  class ComponentLayout
    include Properties

    optional_properties :column_span, :column_start, :content_inset, :horizontal_content_alignment,
                        :ignore_document_gutter, :ignore_document_margin, :margin,
                        :maximum_content_width, :minimum_height
  end
end
