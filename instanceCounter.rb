module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
end
module ClassMethods
  attr_accessor :count_instances
  def instances
    self.class_variable_get(:@count_instances)
  end
end

module InstanceMethods
  protected

  def register_instence
    self.class.count_instances ||=0
    self.class.count_instances +=1
  end
end