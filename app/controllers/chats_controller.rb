class ChatsController < ApplicationController

    before_action :authenticate_user!

    def index
        @chats = Chat.all
    end

    def show
        # authorize Chat
        @chat = Chat.new
        @chat.build.messages.build
    end

end
