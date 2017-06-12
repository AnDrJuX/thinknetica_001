class Train
  attr_accessor :route, :speed, :number
  attr_reader :current_station, :type

  def initialize(number, type)
    @number = number
    @wagons = []
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
    puts "Поезд состоит из #{@wagons.size} вагонов"
  end

  def hookup(wagon)
    if @speed.zero?
      @wagons.push(wagon)
      puts "Вагон #{wagon} прицеплен."
    else
      puts 'Остановите поезд, что бы прицепить вагон!'
    end
  end

  def uncoupling(wagon)
    if @wagons.include?(wagon)
      puts 'Этот вагон не прицеплен к поезду.'
    elsif @speed.zero?
      @wagons.delete(wagon)
      puts "Вагон #{wagon} отцеплен."
    else
      puts 'Остановите поезд, что бы отцепить вагон!'
    end
  end

  def set_route(route)
    @route = route
    @current_station_index = 0
    current_station.take_train(self)
    puts "Поезду назначен маршрут следования."
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

  protected

  # Тут методы которые не нужны для пользования извне программы. Это реализация инкапсуляции.
  # Методы внесены в protected для того, что бы следуя "соглашению" дать к ним доступ из дочерних классов

  def current_station
    @current_station = @route.stations[@current_station_index]
  end

  def next_station
    @next_station = @route.stations[@current_station_index.next]
  end

  def previous_station
    @previous_station = @route.stations[@current_station_index.pred]
  end

end
