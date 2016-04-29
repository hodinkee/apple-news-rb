require 'apple-news/behaviors/base'
Dir["#{File.dirname(__FILE__)}/behaviors/*.rb"].each { |path| require path }

module AppleNews
  module Behavior
    extend self

    def factory(data)
      return if data.nil?
      
      behaviors.each do |behavior|
        if behavior.type == data[:type]
          return behavior.new(data)
        end
      end

      nil
    end

    private

    def behaviors
      @behaviors ||= self.constants.
        map { |const| self.const_get(const) }.
        select { |const| const.name.demodulize != "Base" && const.is_a?(Class) }
    end
  end
end
