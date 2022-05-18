class AdminsController < ApplicationController

    before_action :authenticate_user!

    def index
        unless current_user.has_role? :admin
            forbidden
        end
    end

end
