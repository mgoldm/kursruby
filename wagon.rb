class Wagon
  include Manufacturer
  include InstanceCounter
  attr_reader :type
  def initialize(type)
    register_instence
    @type=type
  end

  def give_manufacturer(name)
    add_manufact(name)
  end

  def show_manufacturer
    show_manufact
  end
end
