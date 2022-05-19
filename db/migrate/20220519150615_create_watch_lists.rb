class CreateWatchLists < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_lists do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
