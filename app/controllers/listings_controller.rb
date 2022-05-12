class ListingsController < ApplicationController
    include Pundit::Authorization

    before_action :set_user, only: [:new, :edit]
    before_action :find_listing, only: [:show, :update, :edit, :destroy]
    before_action :return_images, :return_modification_types, only: [:show]
    helper_method :return_mods

    def index
        @listings = Listing.all
    end

    def show; end

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
            show_error_retry(@listing,'new')
        end
    end

    def edit; end

    def update
        @listing.update(listing_params)
        if @listing.valid?
        redirect_to @listing
        else
      show_error_retry(@listing,'edit')
        end
    end

    def destroy
    @listing.destroy
    redirect_to listings_path
    end

  private

    def listing_params
        params.require(:listing).permit(:car_id, :profile_id, :price, :description, :color, :year, car_images: [],
            car_attributes: [:id, :make, :model], modifications_attributes: [:id, :modification_type, :name])
    end

    def set_user
        @profile_id = current_user.id
    end

    def find_listing
        @listing = Listing.find(params[:id])
    end

    def return_mods(mod_type)
        return mods = @listing.modifications.where(modifications: { modification_type: mod_type })
    end
    
    def return_modification_types
       return @mod_types = @listing.modifications.distinct.pluck('modification_type')
    end

    def return_images
        @images = @listing.car_images_attachments
    end
end
