class User < ActiveRecord::Base
  #cool.  

  def say_name
    "my name is #{self.name}"
  end
end