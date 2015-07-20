# Default Template
class DefaultTemplate < PrettyDoc::Template
  def initialize
    self.dir = Pathname.new(__FILE__).dirname
  end
end

PrettyDoc::Template.register('default', DefaultTemplate.new)
