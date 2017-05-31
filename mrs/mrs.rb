# *************************************** Station
class Station
  attr_reader :stations, :name

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
  attr_accessor :stations

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
  attr_accessor :wagons, :route, :station, :speed, :number, :type, :current_station

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
    @current_station_index = 0
    current_station.take_train(self)
    puts "Поезду назначен маршрут следования."
  end

  def current_station
    @current_station = @route.stations[@current_station_index]
  end

  def next_station
    @next_station = @route.stations[@current_station_index.next]
  end

  def previous_station
    @previous_station = @route.stations[@current_station_index.pred]
  end

  def move_next_station
    if @current_station_index == @route.stations.length-1
      puts 'Не получится. Поезд на последней станции.'
    else
      @current_station.send_train(self)
      @current_station = next_station
      @current_station_index+=1
      @current_station.take_train(self)
      puts "Поезд поехал на следующую станцию #{@current_station.name}"
    end
  end

  def move_previous_station
    if @current_station_index > 0
      puts 'Не получится. Поезд на первой станции.'
    else
      @current_station.send_train(self)
      @current_station = previous_station
      @current_station_index-=1
      @current_station.take_train(self)
      puts "Поезд поехал на предыдущую станцию #{current_station.name}"
    end
  end

  def show_stations
    puts "Поезд находится на станции #{current_station.name}"
    puts "Позади осталась станция #{previous_station.name}" if @current_station_index > 0
    puts "Следующая станция #{next_station.name}." if @current_station_index < @route.stations.length-1
  end

end
