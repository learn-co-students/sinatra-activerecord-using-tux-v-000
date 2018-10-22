class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
    puts "hello my"
  end
end
