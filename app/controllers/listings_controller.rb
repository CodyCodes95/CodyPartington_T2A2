class ListingsController < ApplicationController
    # before_action :authenticate_user!

    before_action :set_user

    include Pundit::Authorization

    def index
    end

    def show
    end

def new
    @listing = Listing.new
    @listing.modifications.build
    @listing.build_car
end

def create
    @listing = Listing.create(listing_params)
        if @listing.valid?
        redirect_to @listing
        else
    flash.now[:alert] = @listing.errors.full_messages.join('<br>')
    render 'new'
        end
end

    private
    
    def listing_params
        params.require(:listing).permit(:car_id, :profile_id, :price, :description, :color, :year, car_attributes: [:id, :make,:model], modifications_attributes: [:id, :modification_type,:name])
    end

    def set_user
        @profile_id = current_user.id
        @user = current_user
        @profile = current_user.profile
    end
end
