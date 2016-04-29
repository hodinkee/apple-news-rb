module AppleNews
  module Addition
    class Base
      include Properties

      def self.type(val = nil)
        val.nil? ? _required_property_map[:type][:default] : required_property(:type, val)
      end

      def type
        self.class.type
      end
    end
  end
end
