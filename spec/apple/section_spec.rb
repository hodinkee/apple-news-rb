require 'spec_helper'

describe AppleNews::Section do

  let(:fixture_data) do
    {
      'id'    => '111',
      'type'  => 'section',
      'name'  => 'Test Section',
      'links' => {
        'channel' => 'https://news-api.apple.com/channels/a5164537'
      }
    }
  end

  context 'created with only an id' do
    let(:section) { AppleNews::Section.new('111') }

    before do
      allow_any_instance_of(AppleNews::Section).to receive(:fetch_data).and_return('data' => fixture_data)
    end

    it 'will fetch attributes from the api' do
      expect(section.type).to eq('section')
      expect(section.name).to eq('Test Section')
    end

    it 'will use the default config' do
      expect(section.config).to be(AppleNews.config)
    end
  end

  context 'created with id and a data hash' do
    let(:section) { AppleNews::Section.new('111', fixture_data) }

    it 'will set data attributes without fetching' do
      expect(section.type).to eq('section')
      expect(section.name).to eq('Test Section')
    end

    it 'will use the default config' do
      expect(section.config).to be(AppleNews.config)
    end
  end

  context 'created with id, data hash, and custom config' do
    let(:config) { AppleNews::Configuration.new }
    let(:section) { AppleNews::Section.new('111', fixture_data, config) }

    it 'will set data attributes without fetching' do
      expect(section.type).to eq('section')
      expect(section.name).to eq('Test Section')
    end

    it 'will use the custom config' do
      expect(section.config).to be(config)
    end

    it 'will use the custom config when loading channel' do
      allow_any_instance_of(AppleNews::Channel).to receive(:fetch_data).and_return('data' => {})
      channel = section.channel
      expect(channel.config).to be(config)
    end
  end

end
