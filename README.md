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

Apple News articles are submitted as "bundles", with the article content and attached files together in one request. Because of this, we have the concept of a Document. The Document is the high-level abstraction that contains all of the contents for submission to the Apple News API, as well as the extra metadata that lets us control things like setting whether the article is just a preview or if it's sponsored.

### Configuration

In order to work with the Apple News API, we have to set a couple of configuration params that are available from [News Publisher](https://www.icloud.com/#newspublisher).

``` ruby
AppleNews.config.channel_id = "63aFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"
AppleNews.config.api_key_id = "379FFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"
AppleNews.config.api_key_secret = "miJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
```

### Building Articles

Articles are built using the `AppleNews::Article` class. All articles must have an ID, title, layout, components, and a default component text style.

``` ruby
article = AppleNews::Article.new(nil, identifier: "1")
article.title = "Test Article"
article.layout = AppleNews::Layout.new(columns: 1, width: 1024)
article.component_text_styles[:default] = AppleNews::Style::ComponentText.new(
  font_name: 'Georgia',
  font_size: 14,
  text_color: '#000000'
)

article.components << AppleNews::Component::Heading.new(text: "Test Article")
article.components << AppleNews::Component::Body.new(text: "Just testing out this Ruby gem!")
```

### Creating a Document

A document must have an article. Once it's created, you can set metadata flags and add files to the document bundle.

``` ruby
document = AppleNews::Document.new(article)
document.is_preview = true

# There are 3 different ways you can add a file to the document
document.add_file(File.new("/path/to/image.jpg"))
document.add_file_at_path("/path/to/image.jpg")
document.add_string_as_file("image.jpg", image_contents, "image/jpeg")
```

### Saving a Document

Once you have your document built, you can submit it to the API.

```
document.save!
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hodinkee/apple-news-rb.

