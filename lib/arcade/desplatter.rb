require 'binding_of_caller'

module Arcade
  module Desplatter
    def desplat(*args)
      initialize_binding = binding.of_caller(1)

      method_name = caller_locations(1,1)[0].label.to_sym

      method(method_name).parameters.map do |_, param|
        symbol = param.to_sym
        param_value = initialize_binding.local_variable_get(symbol)
        singleton_class.class_eval { attr_accessor symbol }
        instance_variable_set("@#{param}", param_value)
      end
    end
  end
end
