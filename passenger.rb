class PassengerTrain < Train
  def plus_wagon(wagon)
    if wagon.type=='p'
      super
    else
      return 'Вагон грузовой'
    end
  end
end
