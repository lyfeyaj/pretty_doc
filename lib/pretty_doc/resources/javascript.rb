require 'pretty_doc/resource'

module PrettyDoc
  class Resource
    # Javascript resource
    class Javascript < Resource
      attr_accessor :js_pathname

      def initialize(js_pathname)
        self.js_pathname = js_pathname
      end

      def write(dir, options = {})
        self.js_pathname.children.each do |child|
          if(File.extname(child) == '.js')
            relative_pathname = child.relative_path_from(self.js_pathname)
            FileUtils.cp(child, File.join(dir, relative_pathname))
          end
        end
      end
    end
  end
end
