Dir["#{File.dirname(__FILE__)}/requests/*.rb"].each { |path| require path }

module AppleNews
  module Request
  end
end
