module AppleNews
  class Document
    module Persistence
      extend ActiveSupport::Concern

      included do
        def save!
          request = AppleNews::Request::Post.new(endpoint_url)
          request.fields = {
            'article.json' => json_to_field(article.as_json, "article.json"),
            'metadata' => json_to_field({ data: @metadata }, "metadata")
          }.merge(@files)

          resp = request.call
        end

        private

        def endpoint_url
          if article.persisted?
            "/articles/#{id}"
          else
            "/channels/#{AppleNews.config.channel_id}/articles"
          end
        end

        def json_to_field(data, name)
          UploadIO.new(StringIO.new(JSON.dump(data)), "application/json", name)
        end
      end
    end
  end
end
