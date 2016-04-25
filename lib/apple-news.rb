require "active_support/hash_with_indifferent_access"
require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_support/core_ext/string/inflections"

require "apple-news/version"
require "apple-news/properties"
require "apple-news/configuration"
require "apple-news/client"
require "apple-news/channel"
require "apple-news/article"
require "apple-news/addition"
require "apple-news/animation"
require "apple-news/behavior"
require "apple-news/component"
require "apple-news/component_layout"
require "apple-news/layout"
require "apple-news/metadata"
require "apple-news/property"
require "apple-news/scene"
require "apple-news/style"

module AppleNews
  extend self

  def config
    @config ||= Configuration.new
  end
end
