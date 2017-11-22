require 'pry'

module Desplatter
  def self.prepended base
    def desplat(captured_binding)
      unique_variables = captured_binding.local_variables - binding.local_variables

      unique_variables.each do |variable|
        self.class.send(:attr_accessor, variable)
        instance_variable_set("@#{variable.to_s}", captured_binding.local_variable_get(variable))
      end
    end
  end
end

