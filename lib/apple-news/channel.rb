module AppleNews
  class Channel
    include Resource
    include Links

    attr_reader :id, :type, :name, :website, :links, :created_at, :modified_at,
                :default_section, :share_url

    def self.current
      warn 'DEPRECATION WARNING: `AppleNews::Channel.current` is deprecated. '\
           'Please use `AppleNews.config.channel` instead.'
      AppleNews.config.channel
    end

    def initialize(id, data = nil, config = AppleNews.config)
      @id = id
      @config = config
      @resource_path = '/channels'

      data.nil? ? hydrate! : set_read_only_properties(data)
    end

    def default_section
      Section.new(section_link_id('defaultSection'), nil, config)
    end

    def sections
      resp = get_request("/channels/#{id}/sections")
      resp['data'].map do |section|
        Section.new(section['id'], section, config)
      end
    end

    def articles(params = {})
      params  = params.with_indifferent_access
      hydrate = params.delete(:hydrate)
      resp = get_request("/channels/#{id}/articles", params)
      resp['data'].map do |article|
        data = hydrate == false ? article : {}
        Article.new(article['id'], data, config)
      end
    end
  end
end
