require_relative 'lib/arcade.rb'

class Test
  prepend Arcade::Desplatter

  def set_values(name, age, email)
    puts "Actual"
  end

  def test
    puts name
    puts age
    puts email
  end

  desplat :set_values
end


class OldTest
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
    test
  end

  def test
    puts name
    puts age
    puts email
  end
end

puts "We are creating a new Test instance"
test = Test.new
puts test.methods.include? :set_values
test.set_values('James McLaren', 20, "james@workplacearcade.com")
# OldTest.new('James McLaren', 20, "james@workplacearcade.com")
