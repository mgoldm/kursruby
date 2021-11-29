class Station
  attr_reader :title, :trains
  include InstanceCounter
  include Validate
  #validate :title, :type, Station

  def initialize(title)
    register_instance
    @title = title
    @trains = []
    #validate!
  end

  def train_on_station(train)
    @trains << train
  end

  def show_train
    puts @trains
  end

  def trains_by(type)
    @trains.filter { |train| train.type == type }
  end

  def count_trains_by(type)
    trains_by(type).length
  end

  def send_from_station(train)
    @trains.delete(train)
  end

  def each_train
    trains.each { |train| yield(train) } if block_given?
  end

end

