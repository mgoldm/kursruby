module Manufacturer
  def add_manufact(manufacturer)
    @manufacturer=manufacturer
  end

  def show_manufact
    @manufacturer
  end

  protected
  attr_accessor :manufacturer
end


