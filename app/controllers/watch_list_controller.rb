class WatchListController < ApplicationController

    before_action :authenticate_user!

    def index
        set_list
    end

    def create
        WatchList.create!(watch_list_params)
    end

    def destroy
        WatchList.delete(watch_list_params[:list_item_id])
        redirect_to watchlist_path
    end

    private
    
    def watch_list_params
        params.permit(:listing_id, :profile_id, :list_item_id)
    end

    def set_list
        @watch_list = WatchList.where(profile_id:current_user.profile.id).includes(:listing)
    end

end
