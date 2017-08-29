require 'apple-news/article/attachments'
require 'apple-news/article/persistence'
require 'apple-news/document'

module AppleNews
  class Article
    include Attachments
    include Persistence
    include Resource
    include Properties

    optional_properties :is_sponsored, :is_preview, :accessory_text, :revision,
                        :maturity_rating, :is_candidate_to_be_featured
    optional_property :links, {}

    attr_reader :id, :type, :title, :share_url, :state, :warnings, :created_at, :modified_at
    attr_accessor :document

    def initialize(id = nil, data = {}, config = AppleNews.config)
      assign_data(data)

      @id = id
      @config = config
      @resource_path = '/articles'
      @files = {}

      hydrate! if id.present? && data.blank?
    end

    def reload
      return false if id.nil?
      hydrate!
    end

    private

    def hydrate!
      data = fetch_data['data']
      assign_data(data)
    end

    def assign_data(data)
      data = data.with_indifferent_access
      document = data.delete(:document)

      set_read_only_properties(data)
      load_properties(data)

      @document = document.is_a?(AppleNews::Document) ? document : Document.new(document)
    end
  end
end
