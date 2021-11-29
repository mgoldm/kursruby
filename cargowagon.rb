class CargoWagon < Wagon
  include Accessors
  include Validate
  attr_reader :freesize, :loade
  validate :freesize, :presence
  def initialize(size)
    validate!
    @freesize = size
    @type = 'g'
    @loade = 0
  end

  def loading(size)
    @freesize -= size
    @loade += size
  end
end

