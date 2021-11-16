class Route
  attr_reader :list_stations

  def initialize(first_station, last_station)
    @list_stations = [first_station, last_station]
  end

  def add_list(new_station)
    @list_stations[@list_stations.length] = @list_stations[@list_stations.length - 1]
    @list_stations[@list_stations.length - 2] = new_station
  end

  def delete_list(delete_station)
    for i in 0..@list_stations.length-1
      if @list_stations[i] == delete_station
        @list_stations.delete_at(i)
      end
    end
  end

  def show
    for i in 0..@list_stations.length-1
      print "#{@list_stations[i]} \n", i
    end
  end
end
