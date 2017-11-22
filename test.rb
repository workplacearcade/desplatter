require_relative 'lib/desplatter.rb'

class Test
  prepend Desplatter

  def set_values(name, age, email)
    desplat binding
  end

  def test
    puts name
    puts age
    puts email
  end
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
test.set_values('James McLaren', 20, "james@workplacearcade.com")
puts test.email
# OldTest.new('James McLaren', 20, "james@workplacearcade.com")
