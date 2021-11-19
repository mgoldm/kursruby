class CargoTrain < Train
  def initialize(number, type='g', speed = nil)
    super
    @type=type
  end
end

