# Apple News

A fully featured gem for building Apple News documents and interfacing with the Apple News API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apple-news'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apple-news

## Usage

### Building Articles

Articles are built using the `AppleNews::Article` class. All articles must have an ID, title, layout, components, and a default component text style.

``` ruby
article = AppleNews::Article.new(123)
article.title = "Check Out Apple News"
article.layout = AppleNews::Layout.new(columns: 1, width: 1024)
article.component_text_styles[:default] = AppleNews::Style::ComponentText.new(
    text_color: '#000000',
    font_name: "Helvetica Neue"
)
article.components << AppleNews::Component::Heading.new(
    text: "Check Out Apple News"
)

puts article.as_json
#=> {"id"=>123, "title"=>"Check Out Apple News", "layout"=>{"columns"=>1, "width"=>1024}, "components"=>[{"text"=>"Check Out Apple News", "role"=>"heading"}], "componentTextStyles"=>{"default"=>{"fontName"=>"Helvetica Neue", "textColor"=>"#000000"}}, "version"=>"1.1", "language"=>"en", "metadata"=>{"generatorName"=>"apple-news-rb", "generatorVersion"=>"0.1.0", "transparentToolbar"=>false}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hodinkee/apple-news-rb.

