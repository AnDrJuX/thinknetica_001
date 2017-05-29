# *************************************** Station
class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
    train.station = nil
  end

  def show_trains(type=nil)
    @trains.each do |train|
      puts "Поезд №#{train.number}" if type == train.type || type.nil?
    end
  end
end

# *************************************** Route
class Route

  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each do |station|
      puts station.name
    end
  end

end

# *************************************** Train
class Train
  attr_accessor :wagons, :route, :station, :speed, :number, :type

  def initialize(number, type)
    @number = number
    @wagons = 0
    @type = type
    @speed = 0
  end

  def speed_up(speed)
    @speed += speed
  end

  def current_speed
    puts @speed
  end

  def stop
    @speed = 0
  end

  def wagons_count
    puts "Поезд состоит из #{@wagons} вагонов"
  end

  def hookup
    if @speed.zero?
      @wagons +=1
      puts "Вагон прицеплен."
    else
      puts 'Остановите поезд, что бы прицепить вагон!'
    end
  end

  def uncoupling
    if @wagons < 0
      puts 'Нечего отцеплять.'
    elsif @speed.zero?
      @wagons -=1
      puts "Вагон отцеплен."
    else
      puts 'Остановите поезд, что бы отцепить вагон!'
    end
  end

  def get_route(route)
    @route = route
    @current_station = 0
    @route[@current_station].take_train(self)
  end

  def move_next_station
    next_station = route.station[@current_station+1]
    route.station[@current_station].send_train(self)
    route.station[@current_station] = next_station
    next_station.take_train(self)
  end

  def move_prev_station
    prev_station = route.station[@current_station-1]
    route.station[@current_station].send_train(self)
    route.station[@current_station] = next_station
    next_station.take_train(self)
  end

  def show_stations
    prev_station = route.station[@current_station-1]
    next_station = route.station[@current_station+1]
    puts "Поезд находится на станции #{@current_station}, позади осталась станция #{prev_station}, следующая станция #{next_station}."
  end

end
