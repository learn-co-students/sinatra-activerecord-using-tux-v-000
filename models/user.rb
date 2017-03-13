class User < ActiveRecord::Base

  def say_name
    "hola my name is #{self.name}"
  end
end
