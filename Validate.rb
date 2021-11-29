module Validate
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validate(name, type, *param)
      validations << { name: name, type: type, params: param }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |value|
        valid = "valid_#{value[:type]}"
        param = value[:param]
        value = instance_variable_get("@#{value[:name]}".to_sym)
        send(valid, value, *param)
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def valid_presence(value)
      raise "Value can't be nill or empty" if value.nil? || value.empty?
    end

    def valid_format(value, format)
      raise "invalid format of value" if value.nil? || value !~ format
    end

    def valid_type(value, type)
      raise "invalid type of value" unless value.is_a?(type)
    end
  end
end


