class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :car, null: false, foreign_key: true
      t.datetime :date_purchased
      t.references :buyer, null: false
      t.references :seller, null: false

      t.timestamps
    end
    add_foreign_key :purchases, :profiles, column: :seller_id
    add_foreign_key :purchases, :profiles, column: :buyer_id
  end
end