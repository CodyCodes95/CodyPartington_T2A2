class SearchController < ApplicationController
    def index
        if current_user
            profile_setup
        end
    end

  private
    def profile_setup
        redirect_to '/profiles/new' if current_user.profile.nil?
    end
end
