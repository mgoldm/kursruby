class Route
  attr_reader :list_stations

  def initialize(first_station, last_station)
    @list_stations = [first_station, last_station]
  end

  def add_to_list(new_station)
    @list_stations.insert(-2, new_station)
  end

  def delete_list(delete_station)
    @list_stations.delete(delete_station)
  end

  def show
    @list_stations.each_with_index do |station, index|
      print index
      print ":"
      print "#{station}\n"
    end

  end
end
