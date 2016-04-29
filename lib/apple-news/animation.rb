require 'apple-news/animations/base'
Dir["#{File.dirname(__FILE__)}/animations/*.rb"].each { |path| require path }

module AppleNews
  module Animation
    extend self

    def factory(data)
      return if data.nil?
      
      animations.each do |animation|
        if animation.type == data[:type]
          return animation.new(data)
        end
      end

      nil
    end

    private

    def animations
      @animations ||= self.constants.
        map { |const| self.const_get(const) }.
        select { |const| const.name.demodulize != "Base" && const.is_a?(Class) }
    end
  end
end
