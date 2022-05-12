class ListingsController < ApplicationController
    # before_action :authenticate_user!

    before_action :set_user, only: [:new]
    before_action :find_listing, only: [:show]

    include Pundit::Authorization

    def index
        @listings = Listing.all
    end

    def show
        return_modification_types
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
        params.require(:listing).permit(:car_id, :profile_id, :price, :description, :color, :year, :car_images, car_attributes: [:id, :make,:model], modifications_attributes: [:id, :modification_type,:name])
    end

    def set_user
        @profile_id = current_user.id
        @user = current_user
        @profile = current_user.profile
    end

    def find_listing
        @listing = Listing.find(params[:id])
    end

    def return_mods(mod_type)
        mods = @listing.modifications.where(modifications: {modification_type:mod_type})
        return mods
    end
    helper_method :return_mods

    def return_modification_types
       return @mod_types = @listing.modifications.distinct.pluck('modification_type')
    end
end
