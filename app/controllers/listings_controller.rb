class ListingsController < ApplicationController
    # before_action :authenticate_user!
    include Pundit::Authorization

    def index
        if current_user
        @profile = current_user.profile
        end
        profile_setup
    end

    def show
        render plain:'hello'
    end

    private
    
    def profile_setup
        if current_user
            redirect_to '/profiles/new' if current_user.profile == nil
        end
    end
end
