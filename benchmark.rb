require 'benchmark'
require_relative 'lib/arcade.rb'

class TestClass
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
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

  def initialize(name, age, email)
    desplat binding
  end

  def other_method(var1, var2)
    desplat binding
  end
end

Benchmark.bm(10) do |x|
  x.report("Core method") do
    100_000.times do
      obj = TestClass.new("James", 23, "james@workplacearcade.com")
      obj.other_method(10, 15)
      obj.name
    end
  end

  x.report("Desplatter") do
    100_000.times do
      obj = DesplatterClass.new("James", 23, "james@workplacearcade.com")
      obj.other_method(10, 15)
      obj.name
    end
  end
end
