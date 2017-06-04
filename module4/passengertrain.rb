class PassengerTrain < Train

  def initialize(number, type = "passenger")
    super
  end

  def hookup(wagon)
    if wagon.instance_of?(PassengerWagon)
      super(wagon)
    else
      puts "К пассажирскому поезду можно прицепить только пассажирские вагоны."
    end
  end

end
