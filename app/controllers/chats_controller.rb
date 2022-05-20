class ChatsController < ApplicationController

    before_action :authenticate_user!
    before_action :find_chat, only: [:show, :update, :new_message, :reject_offer]
    before_action :check_auth, only: [:show, :new_message, :update, :reject_offer]

    def index
        @enquries_made = Chat.includes(:buyer, :seller, :listing, :messages).where(buyer_id: current_user.profile.id)
        @enquries_recieved = Chat.includes(:buyer, :seller, :listing, :messages).where(seller: current_user.profile.id)
    end

    def show; end

    def create
        authorize Chat
        @chat = Chat.new
        @chat = Chat.create!(chat_params)
        @message = Message.new
        redirect_to @chat
    end

    def new; end

    def new_message
       @message = Message.create!(messages_params)
       redirect_to @chat
    end

    def update
        @chat.update!(offer_params)
        redirect_to @chat
    end

    def reject_offer
        @chat.update!(offer: 0)
        Message.create!(messages_params)
        redirect_to @chat
    end

  private

    def chat_params
        params.permit(:car_id, :buyer_id, :seller_id, :listing_id)
    end

    def offer_params
         params.require(:chat).permit(:offer)
    end

    def messages_params
        params.permit(:profile_id, :content, :message_attachment, :chat_id)
    end

    def find_chat
        # Including only necessary associations for optimisation
        @chat = Chat.includes(:listing, :messages).find(params[:id])
        @sender = current_user.profile.id
    end

    def check_auth
        authorize @chat
    end
end
