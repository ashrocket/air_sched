class ConnRef
  attr_accessor :id, :key
  def initialize(attrs ={})
    @id = attrs[:id]
    @key = attrs[:key]

  end
end