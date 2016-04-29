module AppleNews
  class Channel
    include Resource
    include Links

    attr_reader :id, :type, :name, :website, :links, :created_at, :modified_at,
                :default_section, :share_url

    def self.current
      self.new(AppleNews.config.channel_id)
    end

    def initialize(id, data = nil)
      @id = id
      @resource_path = "/channels"

      data.nil? ? hydrate! : set_read_only_properties(data)
    end

    def default_section
      Section.new(section_link_id('defaultSection'))
    end

    def sections
      request = Request::Get.new("/channels/#{id}/sections")
      resp = request.call
      resp['data'].map do |section|
        Section.new(section['id'], section)
      end
    end

    def articles(params = {})
      request = Request::Get.new("/channels/#{id}/articles")
      resp = request.call(params)
      resp['data'].map do |article|
        Article.new(article['id'])
      end
    end
  end
end
