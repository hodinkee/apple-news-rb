module AppleNews
  module Request
    class Post
      attr_reader :url
      attr_accessor :fields

      def initialize(url)
        @config = AppleNews.config
        @url = URI::parse(File.join(@config.api_base, url))
        @fields = {}
      end

      def call
        http = Net::HTTP.new(@url.hostname, @url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        # http.set_debug_output $stderr

        res = http.post(@url, content_body, headers)
        JSON.parse(res.body)
      end

      private

      def multipart
        @multipart ||= Net::HTTP::Post::Multipart.new(@url.path, @fields, {
          parts: {
            'metadata' => {
              'Content-Type' => 'application/json'
            }
          }
        })
      end

      def content_body
        body = multipart.body_stream.read
        multipart.body_stream.rewind
        body
      end

      def authorization
        security = AppleNews::Security.new('POST', @url)
        security.content_type = "multipart/form-data; boundary=#{Net::HTTP::Post::Multipart::DEFAULT_BOUNDARY}"
        security.content_body = content_body

        security.authorization
      end

      def headers
        {
          'Authorization' => authorization,
          'Content-Type' => "multipart/form-data; boundary=#{Net::HTTP::Post::Multipart::DEFAULT_BOUNDARY}"
        }
      end
    end
  end
end
