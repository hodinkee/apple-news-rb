module AppleNews
  class Document
    include Properties

    attr_accessor :id

    required_properties :identifier, :title, :layout
    required_property :layout, nil, Layout
    required_property :components, [], Component, :factory
    required_property :component_text_styles, {}, Style::ComponentText

    required_property :version, "1.1"
    required_property :language, "en"

    optional_properties :advertising_settings, :subtitle, :metadata, :document_style,
                        :text_styles, :component_layouts, :component_styles

    def initialize(opts = nil)
      super
      @metadata = Metadata.new((opts || {}).fetch(:metadata, {}))
    end
  end
end
