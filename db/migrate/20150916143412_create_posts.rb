class CreatePosts < ActiveRecord::Migration
  def up
  	create_table :posts do |t|
  		t.string :content
  		t.string :title
  		t.integer :user_id
  	end
  end

  def down
  	drop_table :posts
  end
end
