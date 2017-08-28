module AppleNews
  module Resource
    extend ActiveSupport::Concern

    included do
      attr_accessor :config

      def update_with_data(data)
        load_properties(data)
      end

      def resource_url
        File.join(@resource_path, id)
      end

      def get_request(path, params = {})
        AppleNews::Request::Get.new(path, config).call(params)
      end

      private

      def hydrate!
        if respond_to?(:load_properties)
          load_properties(fetch_data['data'])
        else
          set_read_only_properties(fetch_data['data'])
        end
      end

      def fetch_data
        get_request(resource_url)
      end

      def set_read_only_properties(data)
        data.each do |k, v|
          instance_variable_set("@#{k.to_s.underscore}", v)
        end
      end
    end
  end
end
