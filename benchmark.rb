require 'benchmark'
require_relative 'lib/arcade.rb'

class TestClass
  attr_accessor :name, :age, :email, :var1, :var2

  def test(name, age, email)
    @name = name
    @age = age
    @email = email
  end

  def other_method(var1, var2)
    @var1 = var1
    @var2 = var2
  end
end

class DesplatterClass
  prepend Arcade::Desplatter

  def test(name, age, email)
  end

  def other_method(var1, var2)
  end

  desplat :test, :other_method
end

puts Benchmark.measure {
  100_000.times do |x|
    obj = TestClass.new
    obj.test("James", 23, "james@workplacearcade.com")
    obj.other_method(10, 15)
  end
}

puts Benchmark.measure {
  100_000.times do |x|
    obj = DesplatterClass.new
    obj.test("James", 23, "james@workplacearcade.com")
    obj.other_method(10, 15)
  end
}
