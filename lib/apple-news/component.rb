Dir["#{File.dirname(__FILE__)}/components/*.rb"].each { |path| require path }

module AppleNews
  class Component
    attr_reader :role
  end
end
