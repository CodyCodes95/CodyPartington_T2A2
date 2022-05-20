class Message < ApplicationRecord

    belongs_to :chat
    belongs_to :profile
    validates :content, :chat_id, :profile_id, presence:true
    validates :content, length: { maximum: 500 }
    has_one_attached :message_attachment
end
