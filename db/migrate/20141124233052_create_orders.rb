class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 12, scale: 4, default: 0.0
      t.datetime :completed_at
      t.integer :state, default: 0
      t.belongs_to :customer, index: true
      t.belongs_to :credit_card, index: true
      t.integer :billing_address_id, index: true
      t.integer :shipping_address_id, index: true

      t.timestamps
    end
  end
end
