module PrettyDoc
  # Common Converter Class that will be inherited
  class Converter
    attr_accessor :content, :options

    def as_html
      convert
    end

    def self.perfer_exts
      []
    end

    # load all descendants
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    private

    # Convert Markdown to Html, implement this method to convert content
    def convert
    end
  end
end
