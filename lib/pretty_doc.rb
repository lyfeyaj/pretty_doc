require 'pathname'
require 'fileutils'

module PrettyDoc
end

require 'pretty_doc/version'
require 'pretty_doc/template'
require 'pretty_doc/converters/markdown'
require 'pretty_doc/resources/source'

# PrettyDoc Module
module PrettyDoc
  def self.template(name)
    @template_loaded = false
    try_load_template_from_gem name
    try_load_template_from_dir name
    try_load_template_from_defaults name
    tmpl = Template.get(File.basename(name))
    if @template_loaded && tmpl
      tmpl
    else
      puts "No valid template '#{name}' found"
      exit
    end
  end

  def self.try_load_template_from_gem(name = '')
    unless @template_loaded
      begin
        require name
        @template_loaded = true
      rescue LoadError
        @template_loaded = false
      end
    end
  end

  def self.try_load_template_from_dir(name = '')
    if !@template_loaded && Dir.exist?(File.expand_path(name))
      begin
        require File.join(File.expand_path(name), 'init.rb')
        @template_loaded = true
      rescue LoadError
        @template_loaded = false
      end
    end
  end

  def self.try_load_template_from_defaults(name = '')
    unless @template_loaded
      begin
        require PrettyDoc.root.join('templates', name, 'init.rb')
        @template_loaded = true
      rescue LoadError
        @template_loaded = false
      end
    end
  end

  def self.root
    Pathname.new(File.expand_path('../../', __FILE__))
  end

  def self.tmpdir
    PrettyDoc.root.join('tmp')
  end

  def self.mktmpdir
    FileUtils.mkdir_p(tmpdir)
    Dir.mktmpdir(nil, tmpdir) do |tmpdir|
      yield(tmpdir)
    end
  end
end
