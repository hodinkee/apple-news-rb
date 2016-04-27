module AppleNews
  module Properties
    extend ActiveSupport::Concern

    def initialize(opts = nil)
      if !opts.nil?
        opts = ActiveSupport::HashWithIndifferentAccess.new(opts)
        self.class.properties.each do |prop, default|
          instance_variable_set "@#{prop}", opts.fetch(prop, default)
        end
      end
    end

    included do
      class_attribute :_required_property_map
      class_attribute :_optional_property_map
      class_attribute :_property_inflection

      self._required_property_map ||= {}
      self._optional_property_map ||= {}
      self._property_inflection ||= {}

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
          json_key = _property_inflection[key] || key.to_s.camelize(:lower)
          val = if send(key).respond_to?(:as_json)
            send(key).as_json
          elsif send(key).is_a?(Array)
            send(key).map(&:as_json)
          elsif send(key).is_a?(Hash)
            Hash[send(key).map {|k, v| [k.to_s, v.as_json]}]
          else
            send(key)
          end

          [json_key, val]
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

      def property_inflection(name, inflection)
        _property_inflection[name] = inflection
      end

      def properties
        _required_property_map.merge(_optional_property_map)
      end
    end
  end
end
