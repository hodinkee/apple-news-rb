require 'stringio'

module AppleNews
  class Document
    attr_accessor :article

    def initialize(article = nil)
      @article = article
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
  end
end
