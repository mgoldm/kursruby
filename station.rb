class Station
  attr_reader :title , :trains
  def initialize(title)
    @title = title
    @trains = []
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



  def send(train)
    @trains.delete(train)

    end
end
