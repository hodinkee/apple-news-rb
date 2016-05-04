module AppleNews
  class Article
    module Persistence
      extend ActiveSupport::Concern

      included do
        def save!
          request = Request::Post.new(endpoint_url)
          request.fields = {
            'metadata' => metadata_field,
            'article.json' => document_json
          }.merge(@files)

          resp = request.call

          return resp['errors'] if resp.has_key?('errors')

          @id = resp['data']['id']
          load_properties(resp['data'])

          true
        end

        def persisted?
          !@id.nil?
        end
        alias_method :saved?, :persisted?

        def delete!
          request = Request::Delete.new(endpoint_url)
          resp = request.call

          return resp['errors'] if resp.is_a?(Hash) && resp.has_key?('errors')
          @id = nil

          true
        end

        def save_to_disk!(path)
          FileUtils.mkdir_p(path)

          # Write the article.json
          File.write(File.join(path, "article.json"), JSON.dump(document.as_json))

          # Write all of the bundled files
          @files.each do |name, file|
            File.write(File.join(path, name), file.read)
          end

          true
        end

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
