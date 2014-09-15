class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :dish_id
      t.string :phone
      t.string :time

      t.timestamps
    end
  end
end
