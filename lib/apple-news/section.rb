module AppleNews
  class Section
    include Resource
    include Links

    attr_reader :id, :type, :name, :is_default, :links, :created_at, :modified_at

    def initialize(id, data = nil)
      @id = id
      @client = AppleNews::Client.new
      @url = "/sections/#{id}"

      data.nil? ? hydrate! : process_data(data)
    end

    def channel
      Channel.new(channel_link_id('channel'))
    end
  end
end
