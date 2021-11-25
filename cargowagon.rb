class CargoWagon < Wagon
  attr_reader :freesize, :loade

  def initialize(size)
    @freesize = size
    @type = 'g'
    @loade = 0
  end

  def loading(size)
    @freesize -= size
    @loade += size
  end
end

