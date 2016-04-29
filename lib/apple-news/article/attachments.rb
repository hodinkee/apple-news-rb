module AppleNews
  class Article
    module Attachments
      extend ActiveSupport::Concern

      included do
        def add_file(file, mime = nil)
          filename = Pathname.new(file).basename.to_s
          mime ||= mime_for(filename)

          @files[filename] = UploadIO.new(file, mime, filename)
        end

        def add_file_at_path(path)
          add_file(File.new(path))
        end

        def add_string_as_file(name, contents, type)
          @files[name] = UploadIO.new(StringIO.new(contents), type, name)
        end

        private

        # I used to use the mime-types gem but apparently Rails uses version
        # 1.x of the gem, which isn't even supported anymore. Since the Apple
        # News API only allows a small handful of attachments, I'm okay with
        # handling them myself.
        def mime_for(filename)
          case File.extname(filename).downcase
          when ".jpg", ".jpeg" then "image/jpeg"
          when ".png" then "image/png"
          when ".gif" then "image/gif"
          else "application/octet-stream"
          end
        end
      end
    end
  end
end
