class User < ActiveRecord::Base
  #changing code
  def say_name
    "my name is #{self.name}"
  end
end
