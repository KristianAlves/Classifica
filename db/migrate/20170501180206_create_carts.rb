class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :ad, index: true, foreign_key: true
      t.string :description
      t.float :amount
      t.integer :quantity, default: 1
      t.timestamps null: false

      t.integer :buyer_id, index: true
    end
    add_foreign_key :carts, :members, column: :buyer_id, primary_key: "id"
  end
end
