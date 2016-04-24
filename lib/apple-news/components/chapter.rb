require 'apple-news/components/container'

module AppleNews
  module Component
    class Chapter < Container
      include Text
      role "chapter"
      optional_property :scene
    end
  end
end
