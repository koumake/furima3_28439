class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      
      t.integer :price,       null: false
      t.text :about,          null: false
      t.integer :genre_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id,         null: false
      t.integer :day_id,         null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
