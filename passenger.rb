class PassengerTrain < Train
  def initialize(number, type='p', speed = nil)
    super
    @type=type
  end
end
