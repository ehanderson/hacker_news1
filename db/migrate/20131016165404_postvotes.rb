class Postvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :vote_counter
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
