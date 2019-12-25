class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
  end

  def say_goodbye
    "goodbye"
  end
end