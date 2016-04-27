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
    end
  end
end
