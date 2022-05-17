class Message < ApplicationRecord

    belongs_to :chat
    belongs_to :profile

    has_one_attached :message_attachment
end
