module AppleNews
  module Component
    class Container < Base
      role "container"
      optional_property :components, [], Component, :factory
    end
  end
end
