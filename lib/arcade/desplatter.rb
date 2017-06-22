require 'binding_of_caller'

module Arcade
  module Desplatter
    def desplat
      calling_binding = binding.of_caller(1)

      calling_method = caller_locations.first.label.to_sym

      method(calling_method).parameters.map do |_, param|
        singleton_class.class_eval { attr_accessor param }
        instance_variable_set("@#{param}", calling_binding.local_variable_get(param))
      end
    end
  end
end
