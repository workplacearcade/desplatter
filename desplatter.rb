require 'binding_of_caller'

module Desplatter
  def desplat
    initialize_binding = binding.of_caller(1)

    method(:initialize).parameters.map do |_, param|
      symbol = param.to_sym
      param_value = initialize_binding.local_variable_get(symbol)
      singleton_class.class_eval { attr_accessor symbol }
      instance_variable_set("@#{param}", param_value)
    end
  end
end
