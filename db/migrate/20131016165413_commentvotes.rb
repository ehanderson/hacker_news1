class Commentvotes < ActiveRecord::Migration
  def change
      create_table :commentvotes do |t|
      t.integer :vote_counter
      t.integer :comment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
