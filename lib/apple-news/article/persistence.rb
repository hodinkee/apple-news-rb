module AppleNews
  class Article
    module Persistence
      extend ActiveSupport::Concern

      included do
        def save!
          request = AppleNews::Request::Post.new(endpoint_url)
          request.fields = {
            'metadata' => metadata_field,
            'article.json' => document_json
          }.merge(@files)

          resp = request.call
          update_with_data(resp['data'])
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

        def document_json
          UploadIO.new(
            StringIO.new(JSON.dump(document.as_json)),
            "application/json",
            "article.json"
          )
        end
      end
    end
  end
end
