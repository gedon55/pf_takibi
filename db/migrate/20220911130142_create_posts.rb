class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :users_id
      t.string :title
      t.text :body
      t.string :place
      t.string :price
      t.date :in_day
      t.date :out_day
      t.integer :member

      t.timestamps
    end
  end
end
