class BusStop

attr_reader :name, :queue

def initialize(name)
  @name = name
  @queue = []
end

def number_of_people_in_queue()
  return @queue.length()
end

def add_person_to_queue(person)
  @queue.push(person)
end

def clear_queue()
  @queue.clear()
end

end