# Simple Template
class SimpleTemplate < PrettyDoc::Template
  def initialize
    self.dir = Pathname.new(__FILE__).dirname
  end
end

PrettyDoc::Template.register('simple', SimpleTemplate.new)
