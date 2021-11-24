class Wagon
  attr_reader :type
  include InstanceCounter

  def initialize(type)
    register_instance
    @type = type
  end

  def validate!
    raise 'Type could be p or g' if type != g or type != p
    raise "Type should be at least 1 symbol" if type.length != 1
    true
  end

  def valid?
    validate!
  rescue
    false
  end
end
