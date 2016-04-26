module AppleNews
  class Channel
    include Resource
    include Links

    attr_reader :id, :type, :name, :website, :links, :created_at, :modified_at,
                :default_section

    def initialize(id, data = nil)
      @id = id
      @client = AppleNews::Client.new
      @url = "/channels/#{id}"

      data.nil? ? hydrate! : process_data(data)
    end

    def default_section
      Section.new(section_link_id('defaultSection'))
    end

    def sections
      data = @client.get("/channels/#{id}/sections")
      data['data'].map do |section|
        Section.new(section['id'], section)
      end
    end
  end
end
