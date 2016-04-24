module AppleNews
  class Metadata
    include Properties
    optional_properties :authors, :campaign_data, :canonical_url, :date_created,
                        :date_modified, :date_published, :excerpt, :generator_identifier,
                        :keywords, :thumbnail_url

    optional_property :generator_name, "apple-news-rb"
    optional_property :generator_version, AppleNews::VERSION
    optional_property :transparent_toolbar, false
  end
end
