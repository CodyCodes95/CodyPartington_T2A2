class AddOfferToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :offer, :integer, :default => 0
  end
end
