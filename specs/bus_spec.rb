require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../bus')
require_relative ('../person')
require_relative ('../bus_stop')

class TestBus < MiniTest::Test

  def setup()
    @bus = Bus.new(22, "Ocean Terminal")
    @passenger1 = Person.new("Joo", 27)
    @passenger2 = Person.new("Rhys", 33)
    @passenger3 = Person.new("Sunny", 21)
    @bus_stop = BusStop.new("A")

  end

  def test_drive
    assert_equal("brum brum", @bus.drive)
  end

  def test_route_number
    assert_equal(22, @bus.route_number())
  end

  def test_destination
    assert_equal("Ocean Terminal", @bus.destination())
  end

  def test_number_of_passengers
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_pick_up_passenger
    @bus.pick_up_passenger(@passenger1)
    assert_equal(1, @bus.number_of_passengers)
  end

  def test_drop_off_passenger
    @bus.pick_up_passenger(@passenger1)
    @bus.drop_off_passenger(@passenger1)
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_empty_bus
    @bus.pick_up_passenger(@passenger1)
    @bus.pick_up_passenger(@passenger2)
    @bus.pick_up_passenger(@passenger3)
    @bus.empty_bus()
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_pick_up_from_stop()
    @bus_stop.add_person_to_queue(@passenger1)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(1, @bus.number_of_passengers())
    assert_equal(0, @bus_stop.number_of_people_in_queue())
  end

  def test_pick_up_multiple_people_from_stop
    @bus_stop.add_person_to_queue(@passenger1)
    @bus_stop.add_person_to_queue(@passenger2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(2, @bus.number_of_passengers())
    assert_equal(0, @bus_stop.number_of_people_in_queue())
  end

  def test_pick_up_from_stop__bus_does_not_start_empty()
    @bus.pick_up_passenger(@passenger3)
    @bus_stop.add_person_to_queue(@passenger1)
    @bus_stop.add_person_to_queue(@passenger2)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal(3, @bus.number_of_passengers())
  end

end