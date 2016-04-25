module AppleNews
  module Behavior
    class Base
      include Properties

      def self.type(val = nil)
        val.nil? ? _required_property_map[:type] : required_property(:type, val)
      end

      def type
        self.class.type
      end
    end
  end
end
