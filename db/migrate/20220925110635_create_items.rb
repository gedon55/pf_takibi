class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :item_name
      
      t.timestamps
    end
  end
end
