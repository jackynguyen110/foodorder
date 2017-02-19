class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.decimal :price
      t.references :food_item, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
