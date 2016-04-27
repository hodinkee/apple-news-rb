module AppleNews
  module Request
    class Post
      attr_reader :url

      def initialize(url)
        @config = AppleNews.config
        @url = url
        @form_fields = {}
      end

      def add_form_field(name, contents)
        
      end

      private

      def headers
        security = AppleNews::Security.new('POST', @url)
        security.content_type = 'multipart/form-data'
        security
      end
    end
  end
end
