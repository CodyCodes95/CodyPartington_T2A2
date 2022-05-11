class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :car, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.integer :price
      t.text :description
      t.string :color
      t.integer :year
      t.references :modification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
