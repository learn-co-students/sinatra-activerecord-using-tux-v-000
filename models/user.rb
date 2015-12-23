class User < ActiveRecord::Base
  has_many :posts
  def say_name
    "my name is #{self.name}"
  end
end