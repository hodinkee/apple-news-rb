module AppleNews
  class Article
    include Properties

    required_properties :id, :title, :layout, :components, :component_text_styles

    required_property :version, "1.1"
    required_property :language, "en"

    optional_properties :advertising_settings, :subtitle, :metadata, :document_style,
                        :text_styles, :component_layouts, :component_styles

    def initialize(id, opts = {})
      super(opts)

      @id = id
      @metadata = Metadata.new(opts.fetch(:metadata, {}))
    end
  end
end
