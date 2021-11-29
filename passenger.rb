class PassengerTrain < Train
  include Validate
  def initialize(number, type='p', speed = nil)
    super
    @type=type
  end
end
