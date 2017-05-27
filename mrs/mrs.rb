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
      puts "#{train.number}" if type == train.type || type?
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
    @stations.each |station| do
      puts station.name
    end
  end

end

# *************************************** Train
class Train
  attr_accessor :speed, :wagons, :route, :station
  Type = [:passanger, :cargo]

  def initialize(number, type, wagons)
    @number = number
    @wagons = wagons
    @type = TYPE[type]
    @speed = 0
  end

  def speed_up(speed)
    self.speed = speed
  end

  def current_speed
    puts @speed
  end

  def stop
    self.speed = 0
  end

  def wagons_count
    puts @wagons
  end

  def hookup
    if self.speed == 0
      @wagons +=1
    else
      puts 'Остановите поезд, что бы прицепить вагон!'
    end
  end

  def uncoupling
    if @wagons < 0
      puts 'Нечего отцеплять.'
    elsif self.speed == 0
      @wagons -=1
    else
      puts 'Остановите поезд, что бы отцепить вагон!'
    end
  end

  def get_route(route)
    self.route = route
    self.station = route.station.first
    route.station.trains.push(self)
  end

  def go_forward

  end

end
