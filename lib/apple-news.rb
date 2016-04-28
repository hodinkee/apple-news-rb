require "active_support/hash_with_indifferent_access"
require "active_support/concern"
require "active_support/core_ext/class/attribute"
require "active_support/core_ext/string/inflections"

require "base64"
require "json"
require 'net/http/post/multipart'
require "mime/types"

require "apple-news/version"
require "apple-news/properties"
require "apple-news/addition"
require "apple-news/animation"
require "apple-news/behavior"
require "apple-news/component"
require "apple-news/component_layout"
require "apple-news/document"
require "apple-news/layout"
require "apple-news/metadata"
require "apple-news/property"
require "apple-news/scene"
require "apple-news/style"

require "apple-news/resource"
require "apple-news/links"
require "apple-news/configuration"
require "apple-news/article"
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

module Parts
  class FilePart
    def build_head(boundary, name, filename, type, content_len, opts = {}, headers = {})
      trans_encoding = opts["Content-Transfer-Encoding"] || "binary"
      content_disposition = opts["Content-Disposition"] || "form-data"

      part = ''
      part << "--#{boundary}\r\n"
      part << "Content-Disposition: #{content_disposition}; name=#{name}; filename=\"#{filename}\"; size=#{content_len}\r\n"
      part << "Content-Length: #{content_len}\r\n"
      if content_id = opts["Content-ID"]
        part << "Content-ID: #{content_id}\r\n"
      end

      if headers["Content-Type"] != nil
        part <<  "Content-Type: " + headers["Content-Type"] + "\r\n"
      else
        part << "Content-Type: #{type}\r\n"
      end

      part << "Content-Transfer-Encoding: #{trans_encoding}\r\n"
      part << "\r\n"
    end
  end
end
