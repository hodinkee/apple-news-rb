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

          @id = resp['data']['id']
          load_properties(resp['data'])
        end

        def persisted?
          !@id.nil?
        end
        alias_method :saved?, :persisted?

        private

        def endpoint_url
          if persisted?
            "/articles/#{id}"
          else
            "/channels/#{AppleNews.config.channel_id}/articles"
          end
        end

        def metadata_field
          JSON.dump({ data: self.as_json })
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
