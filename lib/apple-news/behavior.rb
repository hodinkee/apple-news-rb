require 'apple-news/behaviors/base'
Dir["#{File.dirname(__FILE__)}/behaviors/*.rb"].each { |path| require path }

module AppleNews
  module Behavior
  end
end
