class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings, id: false do |t|
      t.text :text
      t.integer :rating
      t.belongs_to :customer, index: true
      t.belongs_to :book, index: true

      t.timestamps
    end
    add_index :ratings, [:customer_id, :book_id]
  end
end
