class ListingsController < ApplicationController
    include Pundit::Authorization

    before_action :authenticate_user!, except: [:index, :show]
    before_action :check_auth, except: [:index]
    before_action :find_listing, only: [:show, :update, :edit, :destroy]
    before_action :has_permission?, only: [:edit, :destroy]
    before_action :set_user, only: [:new, :edit, :show]
    before_action :return_images, only: [:show]
    before_action :return_modification_types, only: [:new, :show, :edit, :update, :create]
    before_action :return_mod_names, only: [:index]
    helper_method :return_mods

    def index
        profile_setup
        @q = Listing.joins(:listing_modifications, :modifications).ransack(params[:q])
        @listings = @q.result.distinct
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
            show_error_retry(@listing, 'new')
        end
    end

    def edit; end

    def update
        @listing.update(listing_params)
        if @listing.valid?
        redirect_to @listing
        else
      show_error_retry(@listing, 'edit')
        end
    end

    def destroy
    @listing.destroy
    redirect_to listings_path
    end

  private

    def profile_setup
        redirect_to '/profiles/new' if current_user && current_user.profile.nil?
    end

    def listing_params
        params.require(:listing).permit(:car_id, :profile_id, :price, :description, :color, :year, car_images: [],
            car_attributes: [:id, :make, :model], modifications_attributes: [:id, :modification_type, :name])
    end

    def set_user
        @profile_id = current_user.id
    end

    def check_auth
        authorize Listing
    end

    def find_listing
        @listing = Listing.find(params[:id])
    end

    def return_mods(mod_type)
        if @listing
        return mods = @listing.modifications.where(modifications: { modification_type: mod_type })
        else return Modification.where(modifications: { modification_type: mod_type })
        end
    end

    def return_images
        @images = @listing.car_images_attachments
    end

    def return_modification_types
        modifications = Modification.all
        return @mod_types = modifications.distinct.pluck('modification_type')
    end

    def return_mod_names
        return @mod_names = Modification.all.distinct.pluck('name')
    end

    def has_permission?
        if is_admin?
        elsif current_user.profile.id != @listing.profile.id
            forbidden
        end
    end
end
