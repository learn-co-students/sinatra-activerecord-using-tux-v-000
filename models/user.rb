class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
  end
  
  def fav_ice_cream
    "my favorite ice cream is #{self.fav_icecream}. Yum Yum..."
  end 
end