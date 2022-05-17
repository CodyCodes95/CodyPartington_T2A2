class RemoveMessageFromChat < ActiveRecord::Migration[7.0]
  def change
    remove_column :chats, :message_id, :bigint
  end
end
