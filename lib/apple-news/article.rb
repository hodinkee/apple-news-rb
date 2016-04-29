require 'apple-news/article/attachments'
require 'apple-news/article/persistence'

module AppleNews
  class Article
    extend Forwardable

    include Attachments
    include Persistence
    include Resource
    include Properties

    optional_properties :is_sponsored, :is_preview, :accessory_text, :links

    attr_accessor :document
    def_delegator :@document, :id
    def_delegator :@document, :title

    def initialize(id_or_document = nil, data = {})
      @resource_path = "/articles"
      
      if id_or_document.is_a?(Document)
        @document = id_or_document
      else
        @document = Document.new(id_or_document, data.fetch('document', nil))
      end

      @files = {}
      @share_url = data.fetch('shareUrl', nil)
      @state = data.fetch('state', nil)

      hydrate! if !id.nil? && data.keys.size == 0
    end
  end
end
