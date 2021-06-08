# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apple-news/version'

Gem::Specification.new do |spec|
  spec.name          = "apple-news"
  spec.version       = AppleNews::VERSION
  spec.authors       = ["Ryan LeFevre"]
  spec.email         = ["ryan@hodinkee.com"]

  spec.summary       = %q{Fully-featured library for working with the Apple News API.}
  spec.description   = %q{Fully-featured library for fetching and creating content with the Apple News API.}
  spec.homepage      = "https://github.com/hodinkee/apple-news-rb"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "activesupport"
  spec.add_dependency "multipart-post", "~> 2.1.1"
end
