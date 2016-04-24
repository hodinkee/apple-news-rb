module AppleNews
  module Component
    class Base
      include Properties

      optional_properties :identifier, :layout, :style

      def self.role(val = nil)
        val.nil? ? _required_property_map[:role] : required_property(:role, val)
      end

      def role
        self.class.role
      end
    end
  end
end
