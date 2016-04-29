module AppleNews
  module Component
    class Section < Container
      role "section"
      optional_property :scene, nil, Scene, :factory
    end
  end
end
