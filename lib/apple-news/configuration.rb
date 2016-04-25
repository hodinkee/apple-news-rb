module AppleNews
  class Configuration
    attr_accessor :api_key_id, :api_key_secret, :api_base
    
    def initialize
      @api_key_id = nil
      @api_key_secret = nil
      @api_base = 'https://news-api.apple.com'
    end
  end
end
