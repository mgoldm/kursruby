class Wagon
  attr_reader :type
  include InstanceCounter
  def initialize(type)
    register_instence
    @type=type
  end
end
