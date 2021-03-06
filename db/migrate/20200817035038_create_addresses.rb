class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,     null: false
      t.integer :prefecture,                  null: false
      t.string :city,   null: false         
      t.string :house_number   
      t.string :building_name
      t.string :tel,                         null: false
      t.references :purchase,                    foreign_key: true
      t.timestamps
    end
  end
end
