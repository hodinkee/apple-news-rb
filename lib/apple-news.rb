require "apple-news/version"
require "apple-news/configuration"
require "apple-news/client"
require "apple-news/article"

module AppleNews
  extend self

  def config
    @config ||= Configuration.new
  end
end
