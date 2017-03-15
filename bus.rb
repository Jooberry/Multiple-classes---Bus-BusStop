class Bus

attr_reader :route_number, :destination

  def initialize(route_number, destination)
  @route_number = route_number
  @destination = destination
  @passengers = []
  end

  def drive()
    return "brum brum"
  end

  def number_of_passengers()
    return @passengers.length()
  end

  def pick_up_passenger(person)
    @passengers.push(person)
  end

  def drop_off_passenger(person)
    @passengers.delete(person)
  end

  def empty_bus
    return @passengers.clear()
  end

  def pick_up_from_stop(stop)
    for person in stop.queue()
      pick_up_passenger(person)
    end
    stop.clear_queue()
  end


end