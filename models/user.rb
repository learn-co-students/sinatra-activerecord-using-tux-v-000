class User < ActiveRecord::Base

  def say_name
    "my name is the #{self.name}"
  end
end
