require 'spec_helper'

describe AppleNews::Metadata do

  # See: https://developer.apple.com/library/content/documentation/General/Conceptual/Apple_News_Format_Ref/Metadata.html
  let(:attributes) do
    {
      authors: [
        'Joey Ramone',
        'Dee Dee Ramone'
      ],
      campaignData:         { foo: 'bar' },
      canonicalURL:         'https://canonical',
      dateCreated:          '2016-09-08T12:41:00+00:00',
      dateModified:         '2016-09-08T12:41:00+00:00',
      datePublished:        '2016-09-08T12:41:00+00:00',
      excerpt:              'Second verse, same as the first...',
      generatorIdentifier:  'idk',
      generatorName:        'News Publisher',
      generatorVersion:     '12345',
      keywords:             [
        'new york',
        'punk rock'
      ],
      thumbnailURL:         'https://thumbnail',
      transparentToolbar:   true,
      videoURL:             'https://video'
    }
  end

  it 'should return authors' do
    metadata = AppleNews::Metadata.new
    expect(metadata.authors).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.authors[0]).to eq('Joey Ramone')
    expect(metadata.authors[1]).to eq('Dee Dee Ramone')
  end

  it 'should return campaign_data' do
    metadata = AppleNews::Metadata.new
    expect(metadata.campaign_data).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.campaign_data[:foo]).to eq('bar')
  end

  it 'should return canonical_url' do
    metadata = AppleNews::Metadata.new
    expect(metadata.canonical_url).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.canonical_url).to eq('https://canonical')
  end

  it 'should return dates' do
    metadata = AppleNews::Metadata.new
    expect(metadata.date_created).to be_nil
    expect(metadata.date_modified).to be_nil
    expect(metadata.date_published).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.date_created).to eq('2016-09-08T12:41:00+00:00')
    expect(metadata.date_modified).to eq('2016-09-08T12:41:00+00:00')
    expect(metadata.date_published).to eq('2016-09-08T12:41:00+00:00')
  end

  it 'should return excerpt' do
    metadata = AppleNews::Metadata.new
    expect(metadata.excerpt).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.excerpt).to eq('Second verse, same as the first...')
  end

  it 'should return generator info' do
    metadata = AppleNews::Metadata.new
    expect(metadata.generator_identifier).to be_nil
    expect(metadata.generator_name).to eq('apple-news-rb')        # default
    expect(metadata.generator_version).to eq(AppleNews::VERSION)  # default
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.generator_identifier).to eq('idk')
    expect(metadata.generator_name).to eq('News Publisher')
    expect(metadata.generator_version).to eq('12345')
  end

  it 'should return keywords' do
    metadata = AppleNews::Metadata.new
    expect(metadata.keywords).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.keywords[0]).to eq('new york')
    expect(metadata.keywords[1]).to eq('punk rock')
  end

  it 'should return thumbnail_url' do
    metadata = AppleNews::Metadata.new
    expect(metadata.thumbnail_url).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.thumbnail_url).to eq('https://thumbnail')
  end

  it 'should return transparent_toolbar' do
    metadata = AppleNews::Metadata.new
    expect(metadata.transparent_toolbar).to be(false) # default
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.transparent_toolbar).to be(true)
  end

  it 'should return video_url' do
    metadata = AppleNews::Metadata.new
    expect(metadata.video_url).to be_nil
    metadata = AppleNews::Metadata.new(attributes)
    expect(metadata.video_url).to eq('https://video')
  end

end
