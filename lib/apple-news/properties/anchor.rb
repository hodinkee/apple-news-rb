module AppleNews
  module Property
    class Anchor < Base
      required_property :target_anchor_position
      optional_properties :origin_anchor_position, :range_length, :range_start,
                          :target_component_identifier

      def valid?
        super && [
          'top', 'center', 'bottom'
        ].include?(target_anchor_position)
      end
    end
  end
end
