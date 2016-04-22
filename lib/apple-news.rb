require "apple-news/version"
require "apple-news/configuration"
require "apple-news/client"

module AppleNews
  extend self

  def config
    @config ||= Configuration.new
  end
end
