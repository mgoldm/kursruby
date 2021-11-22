class Wagon
  attr_reader :type
  include InstanceCounter

  def initialize(type)
    register_instance
    @type = type
  end
end
