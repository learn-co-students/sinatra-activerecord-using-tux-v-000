class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :fullname
    end
  end

  def down
    drop_table :users
  end

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fav_icecream
    end

  end
end
