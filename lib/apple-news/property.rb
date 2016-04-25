require 'apple-news/properties/base'
Dir["#{File.dirname(__FILE__)}/properties/*.rb"].each { |path| require path }

module AppleNews
  module Property
  end
end
