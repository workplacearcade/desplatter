require 'benchmark'
require_relative 'lib/arcade.rb'

class TestClass
  attr_accessor :name, :age, :email

  def test(name, age, email)
    @name = name
    @age = age
    @email = email
  end
end

class DesplatterClass
  prepend Arcade::Desplatter

  def test(name, age, email)
  end

  desplat :test
end

puts Benchmark.measure {
  100_000.times do |x|
    TestClass.new.test("James", 23, "james@workplacearcade.com")
  end
}

puts Benchmark.measure {
  100_000.times do |x|
    DesplatterClass.new.test("James", 23, "james@workplacearcade.com")
  end
}
