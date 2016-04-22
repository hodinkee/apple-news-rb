module AppleNews
  module Component
    class Author < Base
      attr_accessor :text

      def self.role
        "author"
      end

      def initialize(opts = {})
        opts = ActiveSupport::HashWithIndifferentAccess.new(opts)
        @text = @opts.fetch(:text, "")
      end
    end
  end
end
