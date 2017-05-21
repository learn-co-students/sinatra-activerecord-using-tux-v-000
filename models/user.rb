class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
  end
end

#arbitrary change for pull request
