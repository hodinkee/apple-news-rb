require 'spec_helper'

describe AppleNews::Channel do

  let(:fixture_data) do
    {
      'id'    => '111',
      'type'  => 'channel',
      'name'  => 'Test Channel',
      'links' => {
        'defaultSection' => 'https://news-api.apple.com/sections/4523e2f6'
      }
    }
  end

  context 'created with only an id' do
    let(:channel) { AppleNews::Channel.new('111') }

    before do
      allow_any_instance_of(AppleNews::Channel).to receive(:fetch_data).and_return('data' => fixture_data)
    end

    it 'will fetch attributes from the api' do
      expect(channel.type).to eq('channel')
      expect(channel.name).to eq('Test Channel')
    end

    it 'will use the default config' do
      expect(channel.config).to be(AppleNews.config)
    end
  end

  context 'created with id and a data hash' do
    let(:channel) { AppleNews::Channel.new('111', fixture_data) }

    it 'will set data attributes without fetching' do
      expect(channel.type).to eq('channel')
      expect(channel.name).to eq('Test Channel')
    end

    it 'will use the default config' do
      expect(channel.config).to be(AppleNews.config)
    end
  end

  context 'created with id, data hash, and custom config' do
    let(:config) { AppleNews::Configuration.new }
    let(:channel) { AppleNews::Channel.new('111', fixture_data, config) }

    it 'will set data attributes without fetching' do
      expect(channel.type).to eq('channel')
      expect(channel.name).to eq('Test Channel')
    end

    it 'will use the custom config' do
      expect(channel.config).to be(config)
    end

    it 'will use the custom config when loading sections' do
      allow_any_instance_of(AppleNews::Section).to receive(:fetch_data).and_return('data' => {})
      section = channel.default_section
      expect(section.config).to be(config)
    end
  end

end
