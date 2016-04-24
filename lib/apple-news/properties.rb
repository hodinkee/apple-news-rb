module AppleNews
  module Properties
    extend ActiveSupport::Concern

    def initialize(opts = {})
      opts = ActiveSupport::HashWithIndifferentAccess.new(opts)
      self.class.properties.each do |prop, default|
        instance_variable_set "@#{prop}", opts.fetch(prop, default)
      end
    end

    included do
      class_attribute :_required_property_map
      class_attribute :_optional_property_map

      self._required_property_map ||= {}
      self._optional_property_map ||= {}

      def valid?
        _required_property_map.each do |prop, _|
          return false if send(prop).nil?
        end

        true
      end

      def properties
        self.class.properties
      end

      def as_json
        Hash[properties.map { |key, _|
          val = send(key).respond_to?(:as_json) ? send(key).as_json : send(key)
          [key, val]
        }.reject { |p| p[1].nil? }]
      end
    end

    module ClassMethods
      def inherited(base)
        super
        base._required_property_map = _required_property_map.dup
        base._optional_property_map = _optional_property_map.dup
      end

      def required_properties(*args)
        args.each { |arg| required_property(arg) }
      end

      def required_property(name, default = nil)
        _required_property_map[name] = default
        attr_accessor name
      end

      def optional_properties(*args)
        args.each { |arg| optional_property(arg) }
      end

      def optional_property(name, default = nil)
        _optional_property_map[name] = default
        attr_accessor name
      end

      def properties
        _required_property_map.merge(_optional_property_map)
      end
    end
  end
end
