class User < ActiveRecord::Base

  def say_name
    "My name is #{self.name}"
  end
end