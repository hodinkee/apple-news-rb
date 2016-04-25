require 'apple-news/styles/base'
require 'apple-news/styles/fill'
require 'apple-news/styles/gradient_fill'
require 'apple-news/styles/text'
Dir["#{File.dirname(__FILE__)}/styles/*.rb"].each { |path| require path }

module AppleNews
  module Style
  end
end
