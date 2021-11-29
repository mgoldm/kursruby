module Accessors
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def accessors_with_history(*names)
      names.each do |name|

        define_method("#{name}") do
          instance_variable_get("@#{name}")
        end

        define_method("#{name}_history") do
          instance_variable_get("@#{name}_history")
        end

        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
          history_values = instance_variable_get("@#{name}_history") || []
          instance_variable_set("@#{name}_history", history_values << value)
        end
      end
    end

    def strong_attr_accessor(atribute, class_name)
      define_method ("#{atribute}") do
        instance_variable_get("@#{attribute}")
      end
      define_method ("#{atribute}=") do |value|
        raise TypeError, "Тип должен быть #{class_name}" unless value.is_a(class_name)
        instance_variable_set("@#{atribute}", value)
      end
    end
  end
end

