class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price, precision: 12, scale: 4
      t.integer :quantity
      t.belongs_to :book
      t.belongs_to :order

      t.timestamps
    end
  end
end
