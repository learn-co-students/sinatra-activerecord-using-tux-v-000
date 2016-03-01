#READ

# Using Tux in Sinatra with ActiveRecord

## What Is Tux

Tux is an incredible Ruby gem that lets you access your database and perform all CRUD operations on it through the terminal. It also loads a full environment in the console that allows you to see all routes and views. Primarily, you'll use Tux to make sure your database is set up properly, play around with Ruby objects, and make sure your ActiveRecord associations are working properly.

In this repo there is a simple sinatra app with a `User` model and a method called `say_name`. I want to test that the `say_name` method works.

In order to do that, I need to open up IRB in terminal and require the file `models/user.rb`:

![require models/user.rb](https://s3.amazonaws.com/learn-verified/Screen+Shot+2015-11-19+at+9.46.10+AM.png)

But then I get an error that it doesn't recognize `ActiveRecord`. But when you try to require the ActiveRecord gem, you get the following:

![require activerecord](https://s3.amazonaws.com/learn-verified/require-activerecord.png)

So suddenly, trying to test this method is a big big mess. We keep running into issues. This is why Tux exists. By using the Tux gem, we can easily create objects, and test our methods to manipulate those objects.

## Setup

Setting up Tux is fairly simple. All you need to do is include it in your Gemfile and run `bundle install` in terminal.

## Using Tux

We've got a full Sinatra application with a single `User` class set up. We've already created the migration for you, but make sure you actually run the migration to create the user table.

Next, it's time to use Tux. In terminal in the directory of this walk-through enter `tux`. You should see something like this:

<img src="https://s3.amazonaws.com/learn-verified/tux.png">

The tux console has now loaded. Regular terminal commands won't work at this point, but you can use Ruby and ActiveRecord methods.

### Create

Just like in our controller action, we can create a user.

```ruby
user = User.create(:name => "Tricia", :email => "tricia@test.com", :fav_icecream => "mint chocolate chip")
```

Or:

```ruby
user = User.new
user.name = "Beth"
user.email = "beth@beth.com"
user.fav_icecream = "rocky road"
user.save
```

### Edit

We can edit a user that's already been saved to the database. Let's edit the first user.

```ruby
user = User.first
user.name = "tricia yearwood"
user.save
```

### Delete

Now let's delete the first user:

```ruby
user = User.first
user.delete
```

### Search for Specific Users

All the `find` methods work in Tux too!

```ruby
user = User.find_by_id(2)
user = User.find_by(:name => "Beth")
user = User.first
user = User.last
```

Once you're done, just exit Tux by entering `exit`.
