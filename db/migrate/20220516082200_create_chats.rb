class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :message, null: false, foreign_key: true
      t.references :buyer, null: false
      t.references :seller, null: false
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :chats, :profiles, column: :buyer_id
    add_foreign_key :chats, :profiles, column: :seller_id
  end
end
