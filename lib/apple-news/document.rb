require 'stringio'

require 'apple-news/document/attachments'
require 'apple-news/document/metadata'
require 'apple-news/document/persistence'

module AppleNews
  class Document
    include Attachments
    include Metadata
    include Persistence
    include Resource

    attr_accessor :article, :metadata

    def initialize(article = nil, metadata = {})
      @article = article
      @metadata = {}
      @files = {}
    end
  end
end
