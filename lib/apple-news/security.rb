require 'base64'
require 'openssl'

module AppleNews
  class Security
    attr_accessor :method, :url, :content_type, :content_body

    def initialize(method, url, config = AppleNews.config)
      @method = method.upcase
      @url = url
      @config = config
      @date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      @content_type = nil
      @content_body = nil
    end

    def authorization
      if @method == 'POST' && (@content_type.nil? || @content_body.nil?)
        raise "POST requests require the content type and body to be included in the signature generation"
      end

      "HHMAC; key=#{@config.api_key_id}; signature=#{signature}; date=#{@date}"
    end

    private

    def hash_content
      [@method, @url, @date, @content_type, @content_body].compact
    end

    def canonical_request
      hash_content.join('')
    end

    def key
      Base64.strict_decode64(@config.api_key_secret)
    end

    def digest
      sha256 = OpenSSL::Digest.new('sha256')
      OpenSSL::HMAC.digest(sha256, key, canonical_request)
    end

    def signature
      Base64.strict_encode64(digest)
    end
  end
end
