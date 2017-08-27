module AppleNews
  class Configuration
    attr_accessor :channel_id, :api_key_id, :api_key_secret, :api_base

    def initialize(attributes = {})
      @channel_id     = attributes[:channel_id]
      @api_key_id     = attributes[:api_key_id]
      @api_key_secret = attributes[:api_key_secret]
      @api_base       = attributes[:api_base] || 'https://news-api.apple.com'
    end
  end
end
