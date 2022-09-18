class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :title
      t.text :body
      t.string :place
      t.string :price
      t.datetime :in_day
      t.datetime :out_day
      t.integer :member

      t.timestamps
    end
  end
end
