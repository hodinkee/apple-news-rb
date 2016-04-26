module AppleNews
  module Resource
    extend ActiveSupport::Concern

    included do
      private
      
      def hydrate!
        data = @client.get(@url)
        process_data(data['data'])
      end

      def process_data(data)
        data.each do |k, v|
          instance_variable_set("@#{k.underscore}", v)
        end
      end
    end
  end
end
