class AddProfileToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :profile, null: false, foreign_key: true
  end
end
