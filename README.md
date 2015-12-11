#Using Tux in Sinatra with ActiveRecord

## Objectives

+ Use Tux to test our Sinatra application
+ Practice using Tux to setup our models and associations

## Overview

Sometimes, we want to test out our models and associations without building out the front-end of our application. For example, maybe we'd like to create a new user without building out a signup form. It would be nice if we could test out our code in a console from the command line. Luckily, we can do this using a gem called `tux`. `tux` gives us a shell around our Sinatra application, meaning that we can access any part of it from the command line. Today, we'll be using tux to perform some basic CRUD actions on our models without building out any HTML.


Fork and clone this repository to get started. Run `bundle install` to install any needed gems, including `tux`! 

## Starter Code

We've included two migration files, `20150916143412_create_posts.rb` and `20150916143408_create_users.rb`, which will create tables for `posts` and `users`, respectively. We've also created corresponding models inside of the `models` directory. A post belongs to a user, and a user has many posts. A post has three attributes: `title`, `content`, and `user_id`. A user has `fullname`, `username`, and `email`. 

Run `rake db:migrate` to create your database.

## Using Tux

To get started, open your terminal, navigate to the root of this directory, and run `tux`. You should see the following output:

```bash
tux
D, [2015-09-16T11:00:45.728714 #14788] DEBUG -- :   ActiveRecord::SchemaMigration Load (0.2ms)  SELECT "schema_migrations".* FROM "schema_migrations"
Loading development environment (Rack 1.3)
>> 
```

Look familiar? The `>>` lets us know that we're in a `tux` session. `tux` is a REPL, just like IRB or Pry. We can write any valid Ruby code that we want. 

```bash
>> 1 + 1
=> 2
>> puts "I love Ruby!"
I love Ruby!
=> nil
```

Unlike IRB or Pry, however, tux has preloaded our entire development environment into this console session. This means that we have access to any methods or classes that we can access from our ApplicationController, including our database. For example:

```bash
>> User
=> User(id: integer, username: string, email: string, fullname: string)
>> Post
=> Post(id: integer, content: string, title: string, user_id: integer)
```

This is a great way to debug and test out code. To begin, let's see all of the users that we've created so far. In your `tux` session, type `User.all`.

```bash
>> User.all
```



This returns an empty array. 

```bash
>> User.all
D, [2015-09-16T11:09:35.822251 #14807] DEBUG -- :   User Load (0.2ms)  SELECT "users".* FROM "users"
=> #<ActiveRecord::Relation []>
```
Let's go ahead and create a user. Create a user using the `.create` method.

```bash
>> User.create(:fullname => "Ringo Starr", :username => "ringo123", :email => "ringo@beatles.com")
```

We can see the SQL that was fired by ActiveRecord's `create` method.

```bash
D, [2015-09-16T11:11:18.011233 #14807] DEBUG -- :    (0.1ms)  begin transaction
D, [2015-09-16T11:11:18.027144 #14807] DEBUG -- :   SQL (0.6ms)  INSERT INTO "users" ("fullname", "username", "email") VALUES (?, ?, ?)  [["fullname", "Ringo Starr"], ["username", "ringo123"], ["email", "ringo@beatles.com"]]
D, [2015-09-16T11:11:18.028915 #14807] DEBUG -- :    (1.1ms)  commit transaction
=> #<User id: 1, username: "ringo123", email: "ringo@beatles.com", fullname: "Ringo Starr">
```

 Let's run `User.all` again. 

```bash
>> User.all
```
This outputs: 

```bash
D, [2015-09-16T11:12:52.031732 #14807] DEBUG -- :   User Load (0.3ms)  SELECT "users".* FROM "users"
=> #<ActiveRecord::Relation [#<User id: 1, username: "ringo123", email: "ringo@beatles.com", fullname: "Ringo Starr">]>
```

We've added a row to our users table! Later on, when we build out the views of our application, we'll be able to log in using this user's credentials. Now that we have a user created, let's go ahead and create a post for him. First, let's load our user into a variable using the `.first` method. 

```bash
>> ringo = User.first
```
We'll see the output and return value:

```bash
D, [2015-09-16T11:15:34.222795 #14807] DEBUG -- :   User Load (0.3ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
=> #<User id: 1, username: "ringo123", email: "ringo@beatles.com", fullname: "Ringo Starr">
```

Now, let's make a new instance of our `Post` class using the `.new` method.

```bash
>> post = Post.new
=> #<Post id: nil, content: nil, title: nil, user_id: nil>
>> 
```

Notice that our post doesn't have an id yet. This is because it hasn't been saved to the database. Before we save it, let's update our posts properties. First let's give it a title.

```bash
>> post.title = "A Tale of Two Cities"
=> "A Tale of Two Cities"
```
Next, let's give it some content.

```bash
>> post.content = "It was the best of times, it was the worst of times."
=> "It was the best of times, it was the worst of times."
```

Finally, let's assign the user it a user and save it to our database.

```bash
>> post.user = ringo
=> #<User id: 1, username: "ringo123", email: "ringo@beatles.com", fullname: "Ringo Starr">
>> post.save
D, [2015-09-16T11:18:32.422498 #14807] DEBUG -- :    (0.1ms)  begin transaction
D, [2015-09-16T11:18:32.424797 #14807] DEBUG -- :   SQL (0.7ms)  INSERT INTO "posts" ("title", "content", "user_id") VALUES (?, ?, ?)  [["title", "A Tale of Two Cities"], ["content", "It was the best of times, it was the worst of times."], ["user_id", 1]]
D, [2015-09-16T11:18:32.434429 #14807] DEBUG -- :    (9.0ms)  commit transaction
=> true
```

Now, we can ask `ringo` for all of the `posts` that belong to him.

```bash
>> ringo.posts
```
returns:

```bash
D, [2015-09-16T11:19:27.761086 #14807] DEBUG -- :   Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = ?  [["user_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Post id: 1, content: "It was the best of times, it was the worst of time...", title: "A Tale of Two Cities", user_id: 1>]>
```

Remember that you have access to all of ActiveRecord's awesome methods here. Let's pretend that we have some posts in our database that don't have users associated. This could cause certain parts of our application to break. We could find those by doing:

```bash
>> Post.where(:user_id => nil)
D, [2015-09-16T11:24:24.306142 #14807] DEBUG -- :   Post Load (0.2ms)  SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IS NULL
=> #<ActiveRecord::Relation []>

```

If we wanted to clear our database and start from scratch, we could simply do `Post.destroy_all`:

```bash
>> Post.destroy_all
D, [2015-09-16T11:25:01.550687 #14807] DEBUG -- :   Post Load (0.2ms)  SELECT "posts".* FROM "posts"
D, [2015-09-16T11:25:01.551192 #14807] DEBUG -- :    (0.1ms)  begin transaction
D, [2015-09-16T11:25:01.553719 #14807] DEBUG -- :   SQL (1.5ms)  DELETE FROM "posts" WHERE "posts"."id" = ?  [["id", 1]]
D, [2015-09-16T11:25:01.562801 #14807] DEBUG -- :    (8.8ms)  commit transaction
=> [#<Post id: 1, content: "It was the best of times, it was the worst of time...", title: "A Tale of Two Cities", user_id: 1>]
```


## Resources

+ [Tux Documentation](https://github.com/cldwalker/tux)


<a href='https://learn.co/lessons/sinatra-activerecord-using-tux' data-visibility='hidden'>View this lesson on Learn.co</a>
