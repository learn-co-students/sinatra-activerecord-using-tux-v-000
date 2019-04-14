class User < ActiveRecord::Base

  def say_name #say User name
    "my name is #{self.name}"
  end
end