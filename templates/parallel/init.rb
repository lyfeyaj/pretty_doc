# Parallel Template
class ParallelTemplate < PrettyDoc::Template
  def initialize
    self.dir = Pathname.new(__FILE__).dirname
  end
end

PrettyDoc::Template.register('parallel', ParallelTemplate.new)
