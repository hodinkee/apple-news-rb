require "active_support/hash_with_indifferent_access"

require "apple-news/version"
require "apple-news/configuration"
require "apple-news/client"
require "apple-news/article"
require "apple-news/metadata"
require "apple-news/component"

module AppleNews
  extend self

  def config
    @config ||= Configuration.new
  end
end
