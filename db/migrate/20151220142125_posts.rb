class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :title
      t.integer :user_id
    end
  end
end