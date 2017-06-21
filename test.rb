require_relative 'lib/desplatter'

class Test
  include Desplatter

  def set_values(name, age, email)
    desplat
    @name = "Chris"
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

Test.new.set_values('James McLaren', 20, "james@workplacearcade.com")
# OldTest.new('James McLaren', 20, "james@workplacearcade.com")
