module AppleNews
  module Links
    extend ActiveSupport::Concern

    included do
      def link(name)
        URI::parse(@links[name]).path
      end

      def section_link_id(name)
        link(name).match(/\/sections\/([A-Za-z0-9\-]+)/)[1]
      end
    end
  end
end
