class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
  end

  def stuntin
  	"Always stuntin?"
  end
  
end