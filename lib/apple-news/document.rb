require 'stringio'

module AppleNews
  class Document
    attr_accessor :article, :metadata

    def initialize(article = nil, metadata = {})
      @article = article
      @metadata = {}
      @files = {}
      @client = Client.new
    end

    def add_file(file)
      filename = Pathname.new(file).basename.to_s
      @files[filename] = file
    end

    def add_file_at_path(path)
      add_file(File.new(path))
    end

    def add_string_as_file(name, contents)
      @files[name] = StringIO.new(contents)
    end

    def is_sponsored?
      @metadata['isSponsored']
    end
    alias_method :sponsored?, :is_sponsored?

    def is_sponsored=(val)
      @metadata['isSponsored'] = val
    end

    def is_preview?
      @metadata['isPreview']
    end
    alias_method :preview?, :is_preview?

    def is_preview=(val)
      @metadata['isPreview'] = val
    end

    def accessory_text
      @metadata['accessoryText']
    end

    def accessory_text=(val)
      @metadata['accessoryText'] = val
    end

    def links
      @metadata['links']
    end

    def links=(val)
      @metadata['links'] = val
    end
  end
end
