module AppleNews
  class Article
    attr_reader :id, :version
    attr_accessor :title, :language, :layout, :components, :component_text_styles

    def initialize(id, opts = {})
      @version = '1.0'
      @id = id
      @title = opts.fetch(:title, nil)
      @language = opts.fetch(:language, "en")
      
      @layout = nil
      @components = []
      @component_text_styles = [] # TODO: create default
    end
  end
end
