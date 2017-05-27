class Station

  @@trains = {}

  def initialize(name)
    @name = name
  end

  def come_train(train)
    @@trains[:train] = train.type
  end

  def trains
    @@trains.each_char do |train, type|
      puts "#{train} is #{type}"
    end
  end

  def trains_with_type(trains_type)
    @@trains.each_char do |train, type|
      if trains_type == type
        puts "#{train} is #{type}"
      end
    end
  end

  def send_train

  end

end

class Route

  def initialize(from, to)
    @from = from
    @to = to
  end

end

class Train
  attr_accessor :speed
  Type = [:passanger, :cargo]

  def initialize(number, type, wagons)
    @number = number
    @wagons = wagons
    @type = TYPE[type]
    @speed = 0
  end

  def speed_up(speed)
    @@speed = speed
  end

  def current_speed
    puts @@speed
  end

  def stop
    @@speed = 0
  end

  def wagons_count
    puts @wagons
  end

  def hookup
    if @speed = 0
      @wagons +=1
    else
      puts 'Остановите поезд, что бы прицепить вагон!'
    end
  end

  def uncoupling
    if @speed = 0
      @wagons -=1
    else
      puts 'Остановите поезд, что бы отцепить вагон!'
    end
  end

end
