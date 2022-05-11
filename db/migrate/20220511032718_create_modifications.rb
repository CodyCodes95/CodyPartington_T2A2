class CreateModifications < ActiveRecord::Migration[7.0]
  def change
    create_table :modifications do |t|
      t.string :engine
      t.string :suspension
      t.string :wheels
      t.string :exterior
      t.string :interior
      t.string :exhaust

      t.timestamps
    end
  end
end
