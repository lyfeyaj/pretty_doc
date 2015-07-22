# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_doc/version'

Gem::Specification.new do |s|
  s.name          = 'pretty_doc'
  s.version       = PrettyDoc::VERSION
  s.authors       = ['lyfeyaj']
  s.email         = ['lyfeyaj@gmail.com']
  s.description   = 'Pretty Doc is quick and convenient markdown to html converter with beautiful templates, aiming to provide a simple tool to generate beautiful docs for common use.'
  s.summary       = 'Pretty Doc is quick and convenient markdown to html converter with beautiful templates, aiming to provide a simple tool to generate beautiful docs for common use.'
  s.homepage      = 'https://github.com/lyfeyaj/pretty_doc'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'nokogiri', '~> 1.6.6'
  s.add_dependency 'kramdown', '~> 1.8.0'
  s.add_dependency 'pygments.rb', '~> 0.6.3'
  s.add_dependency 'compass', '~> 1.0.3'
  s.add_dependency 'bootstrap-sass', '~> 3.3.5'
  s.add_dependency 'stringex', '~> 2.5.2'

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency 'rspec', ['>= 3.0.0']
  s.add_development_dependency 'rspec-its', ['>= 1.0.0']
  s.add_development_dependency 'pry', ['>= 0']
end
