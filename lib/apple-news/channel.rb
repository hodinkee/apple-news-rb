module AppleNews
  class Channel
    include Resource
    include Links

    attr_reader :id, :type, :name, :website, :links, :created_at, :modified_at,
                :default_section

    def self.current
      self.new(AppleNews.config.channel_id)
    end

    def initialize(id, data = nil)
      @id = id
      @url = "/channels/#{id}"

      data.nil? ? hydrate! : process_data(data)
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
        Article.new(article['id'], article)
      end
    end
  end
end
