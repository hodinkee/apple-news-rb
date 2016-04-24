module AppleNews
  module Component
    class Base
      include Properties

      class_attribute :_role
      def self.role(val = nil)
        val.nil? ? _role : _role = val
      end
      
      def initialize(opts = {})
        opts = ActiveSupport::HashWithIndifferentAccess.new(opts)
        self.class.properties.each do |prop, default|
          instance_variable_set "@#{prop}", opts.fetch(prop, default)
        end
      end

      def role
        self.class.role
      end

      def as_json
        Hash[properties.map { |key, _|
          [key, send(key)]
        }.reject { |p| p[1].nil? }]
      end
    end
  end
end
