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
    k = @route.list_stations.length
    if @current_station == @route.list_stations[k - 1]
      puts 'The end of way'
    else
      @current_station = next_station

    end
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
    next_st = @route.list_stations[index + 1]
    return next_st
  end

  def previous_station
    index = @route.list_stations.index @current_station
    previous_st = @route.list_stations[index - 1]
    return previous_st
  end

  def show_station
    k = @route.list_stations.length
    if @current_station == @route.list_stations[0]
      return "it's start of the way", "current station is #{@current_station.title}", "the next station is #{next_station.title}"
    elsif @current_station == @route.list_stations[k - 1]
      return "the previous station is #{previous_station.title}", "the curren station is #{@current_station.title}", "this is the end of the way"
    else
      return "the previous station is #{previous_station.title} ", "the current station is #{@current_station.title}", "the next station is #{next_station.title}"

    end

  end
end
