class CreateUsers < ActiveRecord::Migration
  def change
    binding.pry
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fav_icecream
    end
  end
end
