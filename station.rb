class Station
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

  def kol_show
    kp=0
    kg=0
    for i in 1..@trains.length-1
      if @trains[i].type == "p"
        kp=kp+1
        puts "Kolichestvo passagirsk #{kp}"
      else
        kg=kg+1
        puts "kolichestvo grus #{kg}"
      end
    end
  end

  def send(train)
    @trains.number.delete(train.number)

    end
end
