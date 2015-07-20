require 'pretty_doc/resource'

module PrettyDoc
  class Resource
    # Source Resource
    class Source < Resource
      attr_accessor :content, :basename

      def initialize(file, converter, options)
        self.file = file
        extname = File.extname(file)
        self.basename = File.basename(file, extname)
        converter.content = File.read(self.file)
        converter.options = options
        self.content = converter.as_html
      end

      def write(target_dir, options = {})
        template = options[:template]
        result = template.render(content: content)
        target = File.join(target_dir, "#{basename}.html")
        File.open(target, 'w') { |f| f << result }
        template.write_assets(target_dir)
        puts "Create File: #{target}"
      end

      def self.build(options)
        puts 'Converting files ...'
        output_dir = options.output
        options.files.each do |file|
          extname = File.extname(file)
          converter_class = PrettyDoc::Converter.descendants.find do |klass|
            klass.perfer_exts.include?(extname)
          end
          if converter_class
            converter = converter_class.new
            result = new(file, converter, options)
            result.write(output_dir, options)
          else
            puts 'No corresponding converter found!'
          end
        end
      end
    end
  end
end
