module AppleNews
  module Component
    class Author < Base
      role "author"
      required_property :text

      def self.role
        "author"
      end
    end
  end
end
