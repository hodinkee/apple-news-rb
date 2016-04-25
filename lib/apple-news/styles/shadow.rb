module AppleNews
  module Style
    class Shadow < Base
      required_properties :color, :radius
      optional_properties :opacity, :offset
    end
  end
end
