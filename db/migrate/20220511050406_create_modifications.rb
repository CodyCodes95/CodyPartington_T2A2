class CreateModifications < ActiveRecord::Migration[7.0]
  def change
    create_table :modifications do |t|
      t.string :modification_type
      t.string :name

      t.timestamps
    end
  end
end
