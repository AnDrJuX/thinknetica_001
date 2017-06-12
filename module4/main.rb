require_relative 'station'
require_relative 'route'
require_relative 'wagon'
require_relative 'passengerwagon'
require_relative 'cargowagon'
require_relative 'train'
require_relative 'passengertrain'
require_relative 'cargotrain'

puts 'Добро пожаловать на железнодорожную станцию!'
puts 'Введите номер действия, которое вы хотите совершить.'
puts '1 - Создать станцию'
puts '2 - Создать поезд'
puts '3 - Создавать маршрут'
puts '4 - Добавить станцию к маршруту'
puts '5 - Удалить станцию маршрута'
puts '6 - Назначить маршрут поезду'
puts '7 - Добавить вагон к поезду'
puts '8 - Отцепить вагон от поезда'
puts '9 - Переместить поезд по маршруту вперед'
puts '10 - Переместить поезд по маршруту назад'
puts '11 - Просматривать список станций'
puts '12 - Просматривать список поездов на станции'

action = gets.chomp.to_i

case action
when 1
  puts 'Введите название станции'
  st = gets.chomp.to_i
  create_station(st)
when 2
  puts 'Введите номер поезда'
  num = gets.chomp.to_i
  puts 'Введите тип поезда (1 - пассажирский, 2 - грузовой)'
  type = gets.chomp.to_i
  create_train(num, type)
when 3
  puts 'Введите название первой станции'
  from = gets.chomp.to_i
  puts 'Введите название конечной станции станции'
  to = gets.chomp.to_i
  create_route(from, to)
when 4
  puts 'Введите название станции'
  st = gets.chomp.to_i
  puts 'Введите название маршрута'
  rt = gets.chomp.to_i
  add_station_to_route(st,rt)
when 5
  puts 'Введите название станции'
  st = gets.chomp.to_i
  puts 'Введите название маршрута'
  rt = gets.chomp.to_i
  remove_station_from_route(st,rt)
when 6
  puts 'Введите номер поезда'
  tr = gets.chomp.to_i
  puts 'Введите название маршрута'
  rt = gets.chomp.to_i
  add_train_to_route(tr,rt)
when 7
  puts 'Введите номер поезда'
  tr = gets.chomp.to_i
  puts 'Введите название вагона'
  wg = gets.chomp.to_i
  add_wagon_to_train(tr,wg)
when 8
  puts 'Введите номер поезда'
  tr = gets.chomp.to_i
  puts 'Введите название вагона'
  wg = gets.chomp.to_i
  remove_wagon_from_train(tr,wg)
when 9
  puts 'Введите номер поезда'
  tr = gets.chomp.to_i
  send_train_forward(tr)
when 10
  puts 'Введите номер поезда'
  tr = gets.chomp.to_i
  send_train_backward(tr)
when 11
  puts 'Введите название маршрута'
  rt = gets.chomp.to_i
  show_stations_of_route(rt)
when 12
  puts 'Введите название станции'
  st = gets.chomp.to_i
  show_trains_on_station(st)
else
  puts 'Нет такого действия.'
end

# 1
def create_station(st)
  Station.new('st')
end

# 2
def create_train(num, type)
  if type == 1
    PassengerTrain.new(num)
  elsif type == 2
    CargoTrain.new(num)
  end
end

# 3
def create_route(from, to)
  Route.new(from, to)
end

# 4
def add_station_to_route(st,rt)
  rt.add_station(st)
end

# 5
def remove_station_from_route(st,rt)
  rt.delete_station(st)
end

# 6
def add_train_to_route(tr,rt)
  tr.set_route(rt)
end

# 7
def add_wagon_to_train(tr,wg)
  tr.hookup(wg)
end

# 8
def remove_wagon_from_train(tr,wg)
  tr.uncoupling(wg)
end

# 9
def send_train_forward(tr)
  tr.move_next_station
end

# 10
def send_train_backward(tr)
  tr.move_previous_station
end

# 11
def show_stations_of_route(rt)
  rt.show_stations
end

# 12
def show_trains_on_station(st)
  st.show_trains
end
