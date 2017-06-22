require 'benchmark'
require_relative 'lib/arcade.rb'

class TestClass
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end
end

class DesplatterClass
  prepend Arcade::Desplatter

  def initialize(name, age, email)
    desplat
  end
end

puts Benchmark.measure {
  100_000.times do |x|
    TestClass.new("James", 23, "james@workplacearcade.com")
  end
}

puts Benchmark.measure {
  100_000.times do |x|
    DesplatterClass.new("James", 23, "james@workplacearcade.com")
  end
}
