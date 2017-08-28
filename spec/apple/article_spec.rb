require 'spec_helper'

describe AppleNews::Article do

  let(:fixture_data) do
    {
      'id'                      => '111',
      'type'                    => 'article',
      'title'                   => 'Test Article',
      'state'                   => 'PROCESSING',
      'createdAt'               => '2015-02-28T00:49:36Z',
      'modifiedAt'              => '2015-02-28T00:49:36Z',
      'shareUrl'                => 'https://apple.news/111',
      'revision'                => 'AAAAAAAAAAAAAAAAAAAAew==',
      'accessoryText'           => 'by Some Author',
      'maturityRating'          => 'GENERAL',
      'warnings'                => [],
      'isCandidateToBeFeatured' => true,
      'isSponsored'             => false,
      'isPreview'               => false,
      'links' => {
        'channel' => 'https://news-api.apple.com/channels/c111',
        'sections' => [
          'https://news-api.apple.com/sections/s111',
          'https://news-api.apple.com/sections/s222'
        ]
      }
    }
  end

  it 'retains false values' do
    article = AppleNews::Article.new
    article.is_preview = false
    expect(article.as_json['isPreview']).to be(false)
  end

  it 'supports passing in a document' do
    document = AppleNews::Document.new(title: 'My Article')
    article = AppleNews::Article.new('111', document: document)
    expect(article.document).to be(document)
    expect(article.document.title).to eq('My Article')
  end

  it 'will create a document if one is in the data hash' do
    article = AppleNews::Article.new('111', 'document' => { title: 'My Article' })
    expect(article.document).to be_a(AppleNews::Document)
    expect(article.document.title).to eq('My Article')
  end

  it 'will ensure a document if one is not in the data hash' do
    article = AppleNews::Article.new('111', type: 'article')
    expect(article.document).to be_a(AppleNews::Document)
  end

  context 'created with only an id' do
    let(:article) { AppleNews::Article.new('111') }

    before do
      allow_any_instance_of(AppleNews::Article).to receive(:fetch_data).and_return('data' => fixture_data)
    end

    it 'will fetch attributes from the api' do
      expect(article.id).to eq('111')
      expect(article.state).to eq('PROCESSING')
    end

    it 'will use the default config' do
      expect(article.config).to be(AppleNews.config)
    end
  end

  context 'created with id and a data hash' do
    let(:article) { AppleNews::Article.new('111', fixture_data) }

    it 'will set data attributes without fetching' do
      expect(article.id).to eq('111')
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
      expect(article.id).to eq('111')
      expect(article.type).to eq('article')
      expect(article.title).to eq('Test Article')
      expect(article.state).to eq('PROCESSING')
      expect(article.created_at).to eq('2015-02-28T00:49:36Z')
      expect(article.modified_at).to eq('2015-02-28T00:49:36Z')
      expect(article.share_url).to eq('https://apple.news/111')
      expect(article.revision).to eq('AAAAAAAAAAAAAAAAAAAAew==')
      expect(article.accessory_text).to eq('by Some Author')
      expect(article.maturity_rating).to eq('GENERAL')
      expect(article.warnings).to eq([])
      expect(article.is_candidate_to_be_featured).to eq(true)
      expect(article.is_sponsored).to eq(false)
      expect(article.is_preview).to eq(false)
    end

    it 'will serialize the correct attributes as metadata JSON' do
      # make some updates so we know that properties are being persisted/marshalled correctly
      article.revision = 'BBBBBB=='
      article.accessory_text = 'by New Author'
      article.maturity_rating = 'KIDS'
      article.is_candidate_to_be_featured = false
      article.is_sponsored = true
      article.links = {
        'sections' => [
          'https://news-api.apple.com/sections/s333'
        ]
      }
      expect(article.as_json).to eq(
        'revision'                => 'BBBBBB==',
        'accessoryText'           => 'by New Author',
        'maturityRating'          => 'KIDS',
        'isCandidateToBeFeatured' => false,
        'isSponsored'             => true,
        'isPreview'               => false,
        'links' => {
          'sections' => [
            'https://news-api.apple.com/sections/s333'
          ]
        }
      )
    end

    it 'will use the custom config' do
      expect(article.config).to be(config)
    end
  end

end
