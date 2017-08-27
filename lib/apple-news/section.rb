module AppleNews
  class Section
    include Resource
    include Links

    attr_reader :id, :type, :name, :is_default, :links, :created_at, :modified_at, :share_url

    def initialize(id, data = nil, config = AppleNews.config)
      @id = id
      @config = config
      @resource_path = "/sections"

      data.nil? ? hydrate! : set_read_only_properties(data)
    end

    def channel
      Channel.new(channel_link_id('channel'), nil, config)
    end

    def articles(params = {})
      request = Request::Get.new("/sections/#{id}/articles", config)
      resp = request.call(params)
      resp['data'].map do |article|
        Article.new(article['id'], {}, config)
      end
    end
  end
end
