class User < ActiveRecord::Base
#this lab is broke
  def say_name
    "my name is #{self.name}"
  end
end
