class CargoTrain < Train
  def plus_wagon(wagon)
    if wagon.type=='g'
      puts'Вагон грузовой, значит цеплять можно'
      super
    else
      return 'Вагон грузовой'
    end
  end
end
