require 'pretty_doc/plugins/compass'
require 'erb'

module PrettyDoc
  # Base Template class
  class Template
    attr_accessor :dir

    class << self
      def register(name, theme)
        @pool ||= {}
        @pool[name] = theme
      end

      def get(name)
        @pool ||= {}
        @pool[name]
      end
    end

    def theme_file_pathname(file)
      dir.join(file)
    end

    def assets
      [Plugin::Compass.new(dir)]
    end

    def render(hash)
      erb_file = theme_file_pathname('template.html.erb')
      template = ERB.new(erb_file.read)

      @content = hash[:content]
      @title = hash[:title]
      template.result(binding)
    end

    def write_assets(dir)
      assets.each do |asset|
        asset.write(dir)
      end
    end
  end
end
