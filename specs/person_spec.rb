require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../person')

class TestPerson < MiniTest::Test

  def setup
    @person = Person.new("Joo", 27)
  end

  def test_name
    assert_equal("Joo", @person.name)
  end

  def test_age
    assert_equal(27, @person.age)
  end


end