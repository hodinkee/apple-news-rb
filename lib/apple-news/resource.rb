module AppleNews
  module Resource
    extend ActiveSupport::Concern

    included do
      private

      def hydrate!
        request = AppleNews::Request::Get.new(@url)
        resp = request.call
        process_data(resp.body['data'])
      end

      def process_data(data)
        data.each do |k, v|
          instance_variable_set("@#{k.underscore}", v)
        end
      end
    end
  end
end
