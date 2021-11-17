require_relative 'train'
require_relative 'passenger'
require_relative 'route'
require_relative 'station'
require_relative 'cargowagon'
require_relative 'cargo'
require_relative 'PassengerWagon'

station1=Station.new('country')
station2=Station.new('city')
station3= Station.new('tample')


route=Route.new( station1, station2)
route.add_to_list(station3)


cargo_wagon=CargoWagon.new('456')
pass_wagon=PassengerWagon.new('789')

pass_train=PassengerTrain.new('123', 'p')
pass_train.plus_wagon(pass_wagon)

cargo_train=CargoTrain.new('345', 'g')
cargo_train.plus_wagon(cargo_wagon)
cargo_train.minus_wagon(cargo_wagon)

pass_train.movement_forward
pass_train.movement_backward

station1.show_train

route.show

