class Train
  attr_accessor :speed
  attr_reader :wagons, :route, :current_station, :number, :type
  include Manufacturer
  include InstanceCounter

  @@instance_collector = []

  class << self
    #метод класса для отображения всех объектов
    def show_object
      ObjectSpace.each_object(Train).to_a
    end

    def show_objects
      @@instance_collector
    end

    def find(number_of_train)
      @@instance_collector.each do |train|
        if train.number == number_of_train
          train
        else
          return 'Такого поезда нет'
        end
      end

    end

  end

  def initialize(number, type, speed = 0)
    register_instance
    @number = number
    @speed = speed
    @type = type
    @wagons = []
    @@instance_collector << self
    validate!

  end

  FORMAT_NUMBER = /\w{3}-?\w{2}$/

  def validate!
    raise "Number can't be empty" if number.empty?
    raise "Type should be at least 1 symbol" if type.length != 1
    raise "Type should be p or g" if @type != 'g' and @type != 'p'
    raise "Number gas invalid format" if number !~ FORMAT_NUMBER
    true
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def stop
    @speed = 0
  end

  def add_route(route)
    @route = route
    @current_station = route.list_stations[0]
  end

  def movement_forward
    return unless next_station

    @current_station = next_station

  end

  def movement_backward
    return unless previous_station

    @current_station = previous_station
  end

  def next_station
    index = @route.list_stations.index(@current_station)
    next_st = @route.list_stations[index + 1] if @route.list_stations.last != @current_station
    next_st

  end

  def previous_station
    index = @route.list_stations.index(@current_station)
    previous_station = @route.list_stations[index - 1] if @route.list_stations.first != @current_station
    previous_station
  end

  def minus_wagon(wagon)
    @wagons.delete(wagon)
    @wagons
  end

  def plus_wagon(wagon)
    if @type == wagon.type
      @wagons << wagon
      @wagons
    else
      return 'Тип вагона и поезда не совпадает'
    end
  end

  #эти два метода не могу быть использованы в других классах

  private

  def plus
    if @speed == 0
      @wagons = @wagons + 1

    end
  end

  def minus
    if @speed == 0
      @wagons = @wagons - 1
    end
  end
end