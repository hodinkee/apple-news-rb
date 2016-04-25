require 'apple-news/additions/base'
Dir["#{File.dirname(__FILE__)}/additions/*.rb"].each { |path| require path }

module AppleNews
  module Addition
  end
end
