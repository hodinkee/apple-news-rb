require 'spec_helper'

describe AppleNews::Request::Post do

  it 'builds the url from the config' do
    config  = AppleNews::Configuration.new(api_base: 'https://api.foo.com')
    request = AppleNews::Request::Post.new('/somepath', config)
    expect(request.url.to_s).to eq('https://api.foo.com/somepath')
  end

end
