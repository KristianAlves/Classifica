class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :ad, index: true, foreign_key: true
      t.references :buyer, index: true, foreign_key: { to_table: :members }
      t.references :description, index: true, foreign_key: true
      t.float :amount
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
