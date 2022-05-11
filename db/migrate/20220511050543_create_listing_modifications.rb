class CreateListingModifications < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_modifications do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :modification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
