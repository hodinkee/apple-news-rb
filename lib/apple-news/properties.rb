module AppleNews
  module Properties
    extend ActiveSupport::Concern

    def initialize(opts = nil)
      load_properties(opts)
    end

    def load_properties(opts)
      opts = ActiveSupport::HashWithIndifferentAccess.new(opts || {})
      self.class.properties.each do |prop, settings|
        camelized_prop = prop.to_s.camelize(:lower)
        val = if !settings[:klass].nil?
          assigned_val = opts.fetch(camelized_prop, settings[:default])

          if settings[:default].is_a?(Array)
            assigned_val.map { |v|
              v.is_a?(Hash) ? settings[:klass].send(settings[:init_method], v) : v
            }
          elsif settings[:default].is_a?(Hash)
            Hash[assigned_val.map { |k, v|
              [k, v.is_a?(Hash) ? settings[:klass].send(settings[:init_method], v) : v]
            }]
          elsif !assigned_val.nil? && !assigned_val.is_a?(Class)
            assigned_val
          else
            assigned_val.nil? ? nil : settings[:klass].send(settings[:init_method], assigned_val)
          end
        else
          opts.fetch(camelized_prop, settings[:default])
        end

        instance_variable_set "@#{prop}", val
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
            Hash[send(key).map {|k, v|
              [k.to_s, v.respond_to?(:as_json) ? v.as_json : v]
            }]
          else
            send(key)
          end

          [json_key, val.blank? && val != false ? nil : val]
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

      def required_property(name, default = nil, klass = nil, init_method = :new)
        _required_property_map[name] = { default: default, klass: klass, init_method: init_method }
        attr_accessor name
      end

      def optional_properties(*args)
        args.each { |arg| optional_property(arg) }
      end

      def optional_property(name, default = nil, klass = nil, init_method = :new)
        _optional_property_map[name] = { default: default, klass: klass, init_method: init_method }
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
