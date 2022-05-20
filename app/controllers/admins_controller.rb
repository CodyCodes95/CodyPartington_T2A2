class AdminsController < ApplicationController
    before_action :authenticate_user!

    def index
        forbidden unless current_user.has_role? :admin
    end
end
