require 'fileutils'

module PrettyDoc
  # Base Plugin Class
  class Plugin
    attr_accessor :file
    def write(file_dir_io, options = {})
    end
  end
end
