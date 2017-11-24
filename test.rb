require_relative 'lib/desplatter.rb'

class Test
  include Desplatter

  def set_values(name, age, email: 'test@workplacearcade.com')
    email = 'another_test@workplacearcade.com'
    desplat binding
  end
end

test = Test.new
test.set_values('James McLaren', 20)
puts test.email
