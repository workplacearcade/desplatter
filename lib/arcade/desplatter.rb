require 'pry'
require 'binding_of_caller'

module Arcade
  module Desplatter
    def self.prepended base
      base.define_singleton_method(:desplat) do |*args|
        args.each do |arg|
          params = base.new.method(arg).parameters

          Arcade::Desplatter.send(:define_method, arg) do |*args|
            params.map do |_, param|
              singleton_class.class_eval { attr_accessor param }
              instance_variable_set("@#{param}", args[0])
            end
          end
        end
      end
    end
  end
end
