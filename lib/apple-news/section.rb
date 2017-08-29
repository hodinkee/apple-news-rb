module AppleNews
  class Section
    include Resource
    include Links

    attr_reader :id, :type, :name, :is_default, :links, :created_at, :modified_at, :share_url

    def initialize(id, data = nil, config = AppleNews.config)
      @id = id
      @config = config
      @resource_path = '/sections'

      data.nil? ? hydrate! : set_read_only_properties(data)
    end

    def channel
      Channel.new(channel_link_id('channel'), nil, config)
    end

    def articles(params = {})
      params  = params.with_indifferent_access
      hydrate = params.delete(:hydrate)
      resp = get_request("/sections/#{id}/articles", params)
      resp['data'].map do |article|
        data = hydrate == false ? article : {}
        Article.new(article['id'], data, config)
      end
    end
  end
end
