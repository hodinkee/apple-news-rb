require 'apple-news/scenes/base'
Dir["#{File.dirname(__FILE__)}/scenes/*.rb"].each { |path| require path }

module AppleNews
  module Scene
    extend self

    def factory(data)
      return if data.nil?
      
      scenes.each do |scene|
        if scene.type == data[:type]
          return scene.new(data)
        end
      end

      nil
    end

    private

    def scenes
      @scenes ||= self.constants.
        map { |const| self.const_get(const) }.
        select { |const| const.name.demodulize != "Base" && const.is_a?(Class) }
    end
  end
end
