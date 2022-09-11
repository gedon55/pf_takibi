class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :users_id
      t.string :title
      t.text :body
      t.string :place
      t.string :price
      t.datetime :day

      t.timestamps
    end
  end
end
