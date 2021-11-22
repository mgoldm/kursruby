module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
end
module ClassMethods
  attr_accessor :instances
  def instances
    self.class_variable_get(:@instances)
  end
end

module InstanceMethods
  protected

  def register_instence
    self.class.instances ||=0
    self.class.instances +=1
  end
end