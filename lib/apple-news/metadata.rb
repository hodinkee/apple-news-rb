module AppleNews
  class Metadata
    attr_accessor :authors, :campaign_data, :canonical_url, :date_created, :date_modified,
                  :date_published, :excerpt, :generator_identifier, :generator_name,
                  :generator_version, :keywords, :thumbnail_url, :transparent_toolbar

    def initialize(opts = {})
      opts = ActiveSupport::HashWithIndifferentAccess.new(opts)
      
      @authors = opts.fetch(:authors, [])
      @campaign_data = opts.fetch(:camapign_data, {})
      @canonical_url = opts.fetch(:canonical_url, nil)
      @date_created = opts.fetch(:date_created, nil)
      @date_modified = opts.fetch(:date_modified, nil)
      @date_published = opts.fetch(:date_published, nil)
      @excerpt = opts.fetch(:excerpt, nil)
      @generator_identifier = opts.fetch(:generator_identifier, nil)
      @generator_name = opts.fetch(:generator_name, "apple-news-rb")
      @generator_version = opts.fetch(:generator_version, AppleNews::VERSION)
      @keywords = opts.fetch(:keywords, [])
      @thumbnail_url = opts.fetch(:thumbnail_url, nil)
      @transparent_toolbar = opts.fetch(:transparent_toolbar, false)
    end
  end
end
