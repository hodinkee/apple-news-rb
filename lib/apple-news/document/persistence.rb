module AppleNews
  class Document
    module Persistence
      extend ActiveSupport::Concern

      included do
        def save!
          request = AppleNews::Request::Post.new(endpoint_url)
          request.fields = {
            'metadata' => metadata_field,
            'article.json' => article_json
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

        def metadata_field
          JSON.dump({ data: @metadata })
        end

        def article_json
          UploadIO.new(
            StringIO.new(JSON.dump(article.as_json)),
            "application/json",
            "article.json"
          )
        end
      end
    end
  end
end
