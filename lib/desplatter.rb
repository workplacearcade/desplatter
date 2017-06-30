module Desplatter
  def self.prepended base
    base.define_singleton_method(:desplat) do |*args|
      args.each do |arg|
        params = base.instance_method(arg).parameters

        params.map do |_, param|
          base.class_eval { attr_accessor param }
        end

        Desplatter.send(:define_method, arg) do |*args|
          index = 0

          base_args = *args.dup

          if args.length != params.length
            named_params = args[-1]
            args.pop
          end

          params.map do |_, param|
            if index < args.length
              argument = args[index]
              index += 1
            else
              argument = named_params[param]
            end

            instance_variable_set("@#{param}", argument)
          end

          super *base_args
        end
      end
    end
  end
end

