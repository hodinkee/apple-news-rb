module AppleNews
  class Article
    include Resource
    include Properties

    attr_reader :id

    required_properties :identifier, :title, :layout
    required_property :components, []
    required_property :component_text_styles, {}

    required_property :version, "1.1"
    required_property :language, "en"

    optional_properties :advertising_settings, :subtitle, :metadata, :document_style,
                        :text_styles, :component_layouts, :component_styles

    def initialize(id = nil, opts = nil)
      super(opts)

      @id = id
      @url = "/articles/#{id}"
      @metadata = Metadata.new((opts || {}).fetch(:metadata, {}))

      hydrate! if !id.nil? && opts.nil?
    end

    def persisted?
      !@id.nil?
    end
    alias_method :saved?, :persisted?
  end
end
