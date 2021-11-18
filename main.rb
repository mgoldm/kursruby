require_relative 'train'
require_relative 'passenger'
require_relative 'route'
require_relative 'station'
require_relative 'cargowagon'
require_relative 'cargo'
require_relative 'PassengerWagon'

class Controller

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    list = <<TEXT
    Укажите номер действия:
    - Создавать станции 1
    - Создавать поезда 2
    - Создавать маршруты 3
    - Добавить станцию к маршруту 4
    - Удалить станцию из маршрута 5
    - Назначать маршрут поезду 6
    - Добавлять вагоны к поезду 7
    - Отцеплять вагоны от поезда 8
    - Перемещать поезд по маршруту 9
    - Просматривать список станций 10
    - Cписок поездов на станции 11

TEXT
    puts list
  end

  def start
    loop do
      menu
      run
    end
  end

  def run
    puts 'Что нужно сделать'
    action = gets.chomp
    case action
    when "1"
      new_stations
    when "2"
      new_train
    when "3"
      new_route
    when "4"
      add_station_to_route
    when "5"
      delete_station_from_route
    when "6"
      route_to_train
    when "7"
      add_wagon
    when "8"
      delete_wagon
    when "9"
      add_train_to_station
    when "10"
      all_stations
    when "11"
      list_trains_on_station
    end
  end
  private
  def new_stations
    puts 'Введите название станции'
    name_station = gets.chomp
    @stations.push(Station.new(name_station))
    return name_station
  end

  def new_train
    puts 'Укажите номер поезда'
    number = gets.chomp
    puts 'Укажите тип поезда: грузовой- g, пассажирский-p'
    type = gets.chomp
    if type == 'p'
      @trains.push(PassengerTrain.new(number, type))
    elsif type == 'g'
      @trains.push(CargoTrain.new(number, type))
    else
      puts 'Такого типа поездов нет'
    end
  end

  def new_route
    all_stations
    puts 'выберете  первую станцию'
    i = gets.chomp
    first_station = @stations[i.to_i]
    puts 'введите последнюю станцию'
    i = gets.chomp
    last_station = @stations[i.to_i]
    @routes.push(Route.new(first_station, last_station))
  end

  def add_station_to_route
    all_routes
    puts "\n Выберете номер маршрута"
    route_number = gets.chomp
    new_stations
    @routes[route_number.to_i].add_to_list(@stations.last)
  end

  def delete_station_from_route
    all_routes
    puts 'Выберете номер маршрута'
    route_number = gets.chomp
    all_stations
    puts 'ВВедите станцию, которую хотите удалить'
    delete_st = gets.chomp
    @routes[route_number.to_i].delete_list(@stations[delete_st.to_i])
  end

  def all_routes
    #@routes.each_with_index { |route, n| puts "#{n}" "#{route.list_stations}"}
    @routes.each_with_index { |route, n| route.list_stations.each_with_index { |station| print "#{n}" " " "#{station.title}" " " } }
  end

  def all_stations
    @stations.each_with_index { |station, n| puts " #{n} #{station.title}" }
  end

  def all_trains
    @trains.each_with_index { |train, n| puts " #{n} #{train.number}" }
  end

  def route_to_train
    puts('Выберете маршрут')
    all_routes
    i = gets.chomp
    puts('Введите номер поезд')
    all_trains
    number = gets.chomp
    @trains[number.to_i].add_route(@routes[i.to_i])
  end

  def add_wagon
    puts "Укажите номер поезда"
    all_trains
    num = gets.chomp.to_i
    puts @trains[num].type
    if @trains[num].type == "g"
      puts "Этот поезд - грузовой, будет добавлен грузовой вагон"
      wagon = CargoWagon.new("g")
      @trains[num].plus_wagon(wagon)
    elsif @trains[num].type == "p"
      puts "Этот поезд - пассажирский, будет добавлен пассажирский вагон"
      wagon = PassengerWagon.new("p")
      @trains[num].plus_wagon(wagon)
    else
      puts "Такого поезда нет"
    end
  end

  def delete_wagon
    puts 'Укажите индекс поезда'
    all_trains
    num=gets.chomp.to_i
    @trains[num].wagons.delete(num)
    puts 'Вагон был отцеплен'
  end

  def add_train_to_station
    puts "Выберите номер станции к которой хотите добавить поезд"
    all_stations
    num_st = gets.chomp.to_i

    puts "Укажите номер поезда"
    all_trains
    num_tr = gets.chomp.to_i
    @stations[num_st].train_on_station(@trains[num_tr])
    @stations[num_st-1].send(@trains[num_tr])
    @stations[num_st+1].send(@trains[num_tr])
    puts "На станцию #{@stations[num_st].title} Прибыл поезд #{@trains[num_tr].number}"
  end

  def list_trains_on_station
    puts "Выберите номер станции"
    all_stations
    num_st = gets.chomp.to_i
    puts "На станции #{all_stations[num_st].title} находятся поезда: "
    @stations[num_st].trains.each_with_index{ |num, n| puts "#{n} #{num.number}" }
  end

end

controller = Controller.new
controller.start