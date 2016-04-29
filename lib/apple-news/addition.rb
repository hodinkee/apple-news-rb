require 'apple-news/additions/base'
Dir["#{File.dirname(__FILE__)}/additions/*.rb"].each { |path| require path }

module AppleNews
  module Addition
    extend self

    def factory(data)
      return if data.nil?
      
      additions.each do |addition|
        if addition.type == data[:type]
          return addition.new(data)
        end
      end

      nil
    end

    private

    def additions
      @additions ||= self.constants.
        map { |const| self.const_get(const) }.
        select { |const| const.name.demodulize != "Base" && const.is_a?(Class) }
    end
  end
end
