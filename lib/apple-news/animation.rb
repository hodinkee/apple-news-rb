require 'apple-news/animations/base'
Dir["#{File.dirname(__FILE__)}/animations/*.rb"].each { |path| require path }

module AppleNews
  module Animation
  end
end
