module AppleNews
  class Client
    def initialize(config = nil)
      @config ||= AppleNews.config
    end
  end
end
