class Train
  attr_accessor :speed
  attr_reader :wagons, :route, :current_station, :number, :type

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
  end

  def stop
    @speed = 0
  end

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

  def add_route(route)
    @route = route
    @current_station = route.list_stations[0]
  end

  def movement_forward

    return unless next_station

    @current_station = next_station

  end

  def movement_backward
    k = @route.list_stations.length
    if @current_station == @route.list_stations[k - 1]
      @current_station = previous_station
    elsif @current_station == @route.list_stations[0]
      puts 'Start of the way'
    else
      @current_station = previous_station
    end
  end

  def next_station
    index = @route.list_stations.index @current_station
    last_index=@route.list_stations.length
    if @route.list_stations[index]==@route.list_stations[last_index]
      nil
    else
      next_st = @route.list_stations[index + 1]
      next_st
    end
  end

  def previous_station
    index = @route.list_stations.index @current_station
    if @route.list_stations[index]==@route.list_stations[0]
      nil
    else
      previous_st = @route.list_stations[index - 1]
      previous_st
    end
  end
end
