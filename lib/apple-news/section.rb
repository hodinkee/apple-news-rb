module AppleNews
  class Section
    include Resource
    include Links

    attr_reader :id, :type, :name, :is_default, :links, :created_at, :modified_at, :share_url

    def initialize(id, data = nil)
      @id = id
      @resource_path = "/sections"

      data.nil? ? hydrate! : set_read_only_properties(data)
    end

    def channel
      Channel.new(channel_link_id('channel'))
    end

    def articles(params = {})
      request = Request::Get.new("/sections/#{id}/articles")
      resp = request.call(params)
      resp['data'].map do |article|
        Article.new(article['id'])
      end
    end
  end
end
