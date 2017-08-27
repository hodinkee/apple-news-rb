require 'spec_helper'

describe AppleNews::Article do

  let(:fixture_data) do
    {
      'id'    => '111',
      'type'  => 'article',
      'title' => 'Test Article',
      'state' => 'PROCESSING'
    }
  end

  it 'retains false values' do
    article = AppleNews::Article.new
    article.is_preview = false
    expect(article.as_json['isPreview']).to be(false)
  end

  context 'created with only an id' do
    let(:article) { AppleNews::Article.new('111') }

    before do
      allow_any_instance_of(AppleNews::Article).to receive(:fetch_data).and_return('data' => fixture_data)
    end

    it 'will fetch attributes from the api' do
      expect(article.type).to eq('article')
      expect(article.state).to eq('PROCESSING')
    end

    it 'will use the default config' do
      expect(article.config).to be(AppleNews.config)
    end
  end

  context 'created with id and a data hash' do
    let(:article) { AppleNews::Article.new('111', fixture_data) }

    it 'will set data attributes without fetching' do
      expect(article.type).to eq('article')
      expect(article.state).to eq('PROCESSING')
    end

    it 'will use the default config' do
      expect(article.config).to be(AppleNews.config)
    end
  end

  context 'created with id, data hash, and custom config' do
    let(:config) { AppleNews::Configuration.new }
    let(:article) { AppleNews::Article.new('111', fixture_data, config) }

    it 'will set data attributes without fetching' do
      expect(article.type).to eq('article')
      expect(article.state).to eq('PROCESSING')
    end

    it 'will use the custom config' do
      expect(article.config).to be(config)
    end
  end

end
