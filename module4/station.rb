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
