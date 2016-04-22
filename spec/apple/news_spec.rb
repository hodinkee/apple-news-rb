require 'spec_helper'

describe Apple::News do
  it 'has a version number' do
    expect(Apple::News::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
