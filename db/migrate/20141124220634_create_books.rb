class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 12, scale: 4
      t.integer :count_in_stock
      t.belongs_to :author
      t.belongs_to :category

      t.timestamps
    end
  end
end
