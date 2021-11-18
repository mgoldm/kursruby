class CargoTrain < Train
  def plus_wagon(wagon)
    if wagon.type=='g'
      super
    else
      return 'Вагон грузовой'
    end
  end
end
