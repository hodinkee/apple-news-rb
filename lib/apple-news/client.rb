require 'base64'

module AppleNews
  class Client
    def initialize(config = nil)
      @config ||= AppleNews.config
    end

    def get(url)
      conn.get do |req|
        req.url = url
        req.headers = headers
      end
    end

    private

    def conn
      @conn ||= Faraday.new(url: @config.api_base) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def headers(method, url)
      {
        'Authorization' => authorization_header(method, url)
      }
    end

    def authorization_header(method, url)
      date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      canonical_request = "#{method}#{url}#{date}"
      key = Base64.strict_decode64(@config.api_key_secret)

      digest = OpenSSL::Digest.new('sha256')
      hashed = OpenSSL::HMAC.digest(digest, key, canonical_request)
      signature = Base64.strict_encode64(hashed)

      "HHMAC; key=#{@config.api_key_id}; signature=#{signature}; date=#{date}"
    end
  end
end
