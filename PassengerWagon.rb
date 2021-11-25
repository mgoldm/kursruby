class PassengerWagon < Wagon
  attr_reader :ocupied_places, :vacant_places

  def initialize(places)
    @vacant_places = places
    @ocupied_places = 0
    @type = 'p'
  end

  def loading
    @vacant_places -= 1
    @ocupied_places += 1

  end
end
