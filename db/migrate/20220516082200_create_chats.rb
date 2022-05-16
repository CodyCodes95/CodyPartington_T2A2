class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :message, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
