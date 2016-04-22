module AppleNews
  class Article
    attr_reader :id, :version
    attr_accessor :title, :language, :layout, :components, :component_text_styles,
                  :advertising_settings, :subtitle, :metadata, :document_style,
                  :text_styles, :component_layouts, :component_styles

    REQUIRED_PROPERTIES = [
      :version, :id, :title, :language, :layout, :components, :component_text_styles
    ].freeze

    def initialize(id, opts = {})
      @version = '1.1'
      @id = id
      @title = opts.fetch(:title, nil)
      @language = opts.fetch(:language, "en")
      
      @layout = opts.fetch(:layout, nil) 
      @components = opts.fetch(:components, [])
      @component_text_styles = opts.fetch(:component_text_styles, []) # TODO: create default

      # Optional properties
      @advertising_settings = opts.fetch(:advertising_settings, {})
      @subtitle = opts.fetch(:subtitle, nil)
      @metadata = opts.fetch(:metadata, {})
      @document_style = opts.fetch(:document_style, nil)
      @text_styles = opts.fetch(:text_styles, [])
      @component_layouts = opts.fetch(:component_layouts, [])
      @component_styles = opts.fetch(:component_styles, [])
    end

    def valid?
      missing = REQUIRED_PROPERTIES.select { |prop| instance_variable_get("@#{prop}").nil? }
      return false if !missing.empty?
      true
    end
  end
end
