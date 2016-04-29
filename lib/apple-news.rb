require 'active_support/core_ext/hash/indifferent_access'
require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_support/core_ext/string/inflections"

require "base64"
require "json"
require 'net/http/post/multipart'
require 'apple-news/multipart_post_patch'
require 'stringio'

require "apple-news/version"
require "apple-news/properties"
require "apple-news/addition"
require "apple-news/animation"
require "apple-news/behavior"
require "apple-news/component_layout"
require "apple-news/layout"
require "apple-news/metadata"
require "apple-news/property"
require "apple-news/scene"
require "apple-news/style"
require "apple-news/component"

require "apple-news/resource"
require "apple-news/links"
require "apple-news/configuration"
require "apple-news/article"
require "apple-news/document"
require "apple-news/channel"
require "apple-news/request"
require "apple-news/section"
require "apple-news/security"

module AppleNews
  extend self

  def config
    @config ||= Configuration.new
  end
end
