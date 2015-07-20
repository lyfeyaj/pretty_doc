require 'bootstrap-sass'

# Bootstrap Template
class BootstrapTemplate < PrettyDoc::Template
  def initialize
    self.dir = Pathname.new(__FILE__).dirname
  end
end

PrettyDoc::Template.register('bootstrap', BootstrapTemplate.new)
