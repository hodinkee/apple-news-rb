module AppleNews
  class Document
    module Attachments
      extend ActiveSupport::Concern

      included do
        def add_file(file, mime = nil)
          filename = Pathname.new(file).basename.to_s
          mime ||= MIME::Types.type_for(filename)

          @files[filename] = UploadIO.new(file, mime, filename)
        end

        def add_file_at_path(path)
          add_file(File.new(path))
        end

        def add_string_as_file(name, contents, type)
          @files[name] = UploadIO.new(StringIO.new(contents), type, name)
        end
      end
    end
  end
end
