module AppleNews
  module Component
    class Base
      include Properties

      optional_properties :identifier, :layout, :style

      class_attribute :_role
      def self.role(val = nil)
        val.nil? ? _role : _role = val
      end

      def role
        self.class.role
      end
    end
  end
end
