class User < ActiveRecord::Base

  def say_name
    "my name is #{self.name}"
  end
end


#####NO IDEA WHY THIS TEST ISN'T PASSING#####

#####GETTING THIS ERROR#####

#[18:33:58] (master) sinatra-activerecord-using-tux-v-000
#// ♥ objc[70066]: +[__NSPlaceholderDictionary initialize] may have been in progress in another thread when fork() was called.
#objc[70066]: +[__NSPlaceholderDictionary initialize] may have been in progress in another thread when fork() was called. We cannot safelycall it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.