module AppleNews
  class Channel
    attr_reader :channel_id

    def initialize(channel_id)
      @client = AppleNews::Client.new
      @data = {}
      
      hydrate!
    end

    private

    def hydrate!
      @data = @client.get("/channels/#{channel_id}")
    end
  end
end
