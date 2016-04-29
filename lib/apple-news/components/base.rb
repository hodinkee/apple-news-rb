module AppleNews
  module Component
    class Base
      include Properties

      optional_property :identifier
      optional_property :layout, nil, ComponentLayout
      optional_property :style, nil, Style::Component

      def self.role(val = nil)
        val.nil? ? _required_property_map[:role][:default] : required_property(:role, val)
      end

      def role
        self.class.role
      end
    end
  end
end
