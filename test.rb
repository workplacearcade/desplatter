require_relative 'desplatter.rb'

class Test
  include Desplatter

  def initialize(name, age, email)
    desplat
    test
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

Test.new('James McLaren', 20, "james@workplacearcade.com")
# OldTest.new('James McLaren', 20, "james@workplacearcade.com")
