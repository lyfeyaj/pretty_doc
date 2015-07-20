require 'optparse'
require 'ostruct'
require 'pretty_doc'

module PrettyDoc
  class Cli
    class << self
      def run!(args)
        options = OpenStruct.new
        options.template = 'simple'
        options.output = File.expand_path('.')
        options.files = []

        opts_parser = OptionParser.new do |opts|
          opts.banner = 'Pretty document empowered by markup language.'
          opts.separator ''
          opts.separator 'Usage: pretty_doc [options] files'
          opts.separator ''
          opts.separator 'Options:'
          opts.separator ''

          opts.on_tail('-v', '--version', 'output the version number') do
            puts PrettyDoc::VERSION
            exit
          end

          opts.on_tail('-h', '--help', 'output usage information') do
            puts opts
            exit
          end

          opts.on('-o', '--output [path]', 'output to a given folder') do |o|
            options.output = File.expand_path(o || '.')
            if !Dir.exist? options.output
              puts "Directory #{options.output} is not exists, creating new..."
              FileUtils.mkdir_p(options.output)
            end
          end

          opts.on('-t', '--template [folder]', 'choose a template') do |tmpl|
            options.template = tmpl
          end
        end
        opts_parser.parse!(args)
        options.files = args
        options.files = Dir.glob('./*.md') if options.files.length == 0
        if options.files.length == 0
          puts opts_parser
          exit
        end
        options.template = PrettyDoc.template(options.template)
        PrettyDoc::Plugin::Source.build(options)
      end
    end
  end
end
