require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../bus_stop')
require_relative ('../person')

class TestBusStop < MiniTest::Test

  def setup()
    @bus_stop = BusStop.new("Lorne Street")
    @passenger1 = Person.new("Joo", 27)
    @passenger2 = Person.new("Rhys", 33)
    @passenger3 = Person.new("Sunny", 21)

  end

  def test_name
    assert_equal("Lorne Street", @bus_stop.name)
  end

  def test_queue_starts_empty()
    assert_equal(0, @bus_stop.number_of_people_in_queue())
  end

  def test_add_person_to_queue
    @bus_stop.add_person_to_queue(@passenger1)
    assert_equal(1, @bus_stop.number_of_people_in_queue)
  end

  def test_add_multiple_people_to_queue()
    @bus_stop.add_person_to_queue(@passenger1)
    @bus_stop.add_person_to_queue(@passenger2)
    assert_equal(2, @bus_stop.number_of_people_in_queue())
  end

  def test_clear_queue()
    @bus_stop.add_person_to_queue(@passenger1)
    @bus_stop.add_person_to_queue(@passenger2)
    @bus_stop.clear_queue()
    assert_equal(0, @bus_stop.number_of_people_in_queue())
  end

end