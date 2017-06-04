class CargoTrain < Train

  def initialize(number, type = "cargo")
    super
  end

  def hookup(wagon)
    if wagon.instance_of?(CargoWagon)
      super(wagon)
    else
      puts "К грузовому поезду можно прицепить только грузовые вагоны."
    end
  end

end
