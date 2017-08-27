require 'apple-news/article/attachments'
require 'apple-news/article/persistence'

module AppleNews
  class Article
    extend Forwardable

    include Attachments
    include Persistence
    include Resource
    include Properties

    optional_properties :is_sponsored, :is_preview, :accessory_text, :revision, :type
    optional_property :links, {}

    attr_reader :id, :share_url, :state
    attr_accessor :document
    def_delegator :@document, :title

    def initialize(id = nil, data = {}, config = AppleNews.config)
      super(data)

      @id = id
      @config = config
      @resource_path = "/articles"

      document = (data[:document] || data['document'])
      @document = document.is_a?(AppleNews::Document) ? document : Document.new(document)
      @files = {}

      # These are read-only properties that are not submitted to the API
      @share_url = data['shareUrl']
      @state = data['state']

      hydrate! if !id.nil? && data.keys.size == 0
    end

    def reload
      return false if id.nil?
      hydrate!
    end

    private

    def hydrate!
      data = fetch_data['data']
      
      # Some special properties that need to be manually set.
      @document = Document.new(data.delete('document'))
      @share_url = data.delete('shareUrl')
      @state = data.delete('state')

      load_properties(data)
    end
  end
end
