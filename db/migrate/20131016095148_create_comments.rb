class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :paragraph
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
