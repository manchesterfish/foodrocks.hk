class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :restaurant
      t.string :name
      t.integer :price
      t.integer :stock
      t.string :imageURL
      t.string :restaurantURL

      t.timestamps
    end
  end
end
