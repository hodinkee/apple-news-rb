module AppleNews
  module Resource
    extend ActiveSupport::Concern

    included do
      def update_with_data(data)
        process_data(data)
      end

      def resource_url
        File.join(@resource_path, id)
      end

      private

      def hydrate!
        process_data(fetch_data['data'])
      end

      def fetch_data
        request = AppleNews::Request::Get.new(resource_url)
        request.call
      end

      def process_data(data)
        data.each do |k, v|
          instance_variable_set("@#{k.underscore}", v)
        end
      end
    end
  end
end
