module AppleNews
  module Request
    class Get
      attr_reader :url

      def initialize(url, config = AppleNews.config)
        @config = config
        @url = URI::parse(File.join(@config.api_base, url))
      end

      def call(params = {})
        http = Net::HTTP.new(@url.hostname, @url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        res = http.get(@url, headers)
        JSON.parse(res.body)
      end

      private

      def headers
        security = AppleNews::Security.new('GET', @url.to_s, @config)
        { 'Authorization' => security.authorization }
      end
    end
  end
end
