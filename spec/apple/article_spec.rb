require 'spec_helper'

describe AppleNews::Article do
  it 'retains false values' do
    article = AppleNews::Article.new
    article.is_preview = false
    expect(article.as_json["isPreview"]).to be(false)
  end
end
