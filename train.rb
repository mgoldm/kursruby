class Train
  attr_accessor :speed
  attr_reader :wagons, :route, :current_station, :number, :type

  def initialize(number,type,  speed = 0)
    @number = number
    @speed = speed
    @type = type
    @wagons = []
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
    if @type==wagon.type
    @wagons << wagon
    @wagons
    end
  end

  #эти два метода не могу быть использованы в других классах
  private
  def plus
    if @speed == 0
      @wagons = @wagons + 1
    else
      puts 'Тип вагона и поезда не совпадает'
    end
  end
  def minus
    if @speed == 0
      @wagons = @wagons - 1
    end
  end
end

