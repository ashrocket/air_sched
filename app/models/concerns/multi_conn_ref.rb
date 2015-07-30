class MultiConnRef
  attr_accessor :conns
  def initialize(attrs ={})
    @conns = attrs[:conns]
  end

  def key
    @conns.map{|c| c.key}.join('+')
  end
end