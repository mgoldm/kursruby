class Train
  attr_accessor :speed
  attr_reader :kol
  attr_reader :route_for_train
  attr_reader :station
  attr_reader :number
  attr_reader :type

  def initialize(number, type, kol, speed = 0)
    @number = number
    @type = type
    @kol = kol
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def plus
    if @speed == 0
      @kol = kol + 1
    end
  end

  def minus
    if @speed == 0
      @kol = kol - 1
    end
  end

  def routes(route)
    @route_for_train = route
    @station = route.list_stations[0]
  end

  def movement_plus
    k = @route_for_train.list_stations.length
    if @station == @route_for_train.list_stations[k - 1]
      puts 'The end of way'
    elsif @station == @route_for_train.list_stations[0]
      @station = @route_for_train.list_stations[1]
    else
      index = @route_for_train.list_stations.index @station
      @station = @route_for_train.list_stations[index + 1]

    end
  end

  def movement_minus
    k = @route_for_train.list_stations.length
    if @station == @route_for_train.list_stations[k - 1]
      @station = @route_for_train.list_stations[k - 2]
    elsif @station == @route_for_train.list_stations[0]
      puts 'Start of the way'
    else
      index = @route_for_train.list_station.index @station
      @station = @route_for_train.list_stations[index - 1]
    end
  end

  def show_station
    k = @route_for_train.list_stations.length
    if @station == @route_for_train.list_stations[0]
      puts "it's start of the way"
      puts "current station is #{@station.title}"
      puts "the next station is #{@route_for_train.list_stations[1]}"
    elsif @station == @route_for_train.list_stations[k - 1]
      puts "the previous station is #{@route_for_train.list_stations[k - 2]}"
      puts "the curren station is #{@route_for_train.list_stations[k - 1]}"
      puts "this is the end of the way"
    else
      index = @route_for_train.list_stations.index @station
      puts "the previous station is #{@route_for_train.list_stations[index - 1]}"
      puts "the curren station is #{@route_for_train.list_stations[index]}"
      puts "the next station is #{@route_for_train.list_stations[index + 1]}"
    end

  end
end
