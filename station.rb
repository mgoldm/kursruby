class Station
  attr_reader :title
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
    type_train=[]
    @trains.each_with_index do |train, index|
      if train.type==type
        type_train<<train
      end
    end
  end

  def count_trains_by(type)
    return trains_by(type).length
  end



  def send(train)
    @trains.delete(train)

    end
end
