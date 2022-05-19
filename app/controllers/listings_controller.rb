class ListingsController < ApplicationController
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :forbidden
    
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_listing, only: [:show, :update, :edit, :destroy]
    before_action :check_auth, only: [:update, :destroy]
    before_action :check_model_auth, only: [:new, :create, :admin_index]
    before_action :filter_results, only: [:index, :admin_index]
    before_action :set_user, only: [:new, :edit]
    before_action :return_modification_types, only: [:show, :new, :edit]
    helper_method :return_mods, :build_search_items

    def index
        profile_setup
    end

    def admin_index
    end

    def show; end

    def new
        authorize Listing
        @listing = Listing.new
        10.times {@listing.modifications.build}
        @listing.build_car
    end

    def create
        authorize Listing
        @listing = Listing.create(listing_params)
        valid_retry('new')
    end

    def edit; end

    def update
        @listing.update(listing_params)
        valid_retry('new')
    end

    def destroy
    authorize @listing
    @listing.destroy
    redirect_to listings_path
    end

  private

#   Ensures a profile must be set up before continuing navigation of website after registration
    def profile_setup
        redirect_to '/profiles/new' if current_user && current_user.profile.nil?
    end

    def listing_params
        params.require(:listing).permit(:car_id, :profile_id, :price, :description, :color, :year, car_images: [],
                                                                                                   car_attributes: [:id, :make, :model], modifications_attributes: [:id, :modification_type, :name])
    end

    def filter_results
        @q = Listing.joins(:listing_modifications, :modifications).ransack(params[:q])
        @listings = @q.result.distinct
    end

    def valid_retry(action)
        if @listing.valid?
            remove_blank_mods
            redirect_to @listing
        else
            show_error_retry(@listing, action)
        end
    end

    def set_user
        @profile_id = current_user.profile.id
    end

    def check_auth
        authorize @listing
    end

# Used to check auth when a specific instance cannot be loaded (new,create,index)
    def check_model_auth
        authorize Listing
    end

    def find_listing
        @listing = Listing.includes(:profile, :car_images_attachments, :car).find(params[:id])
    end

# Handles allowing not all of the modification fields to be entered in the new listing page without blank entries remaining in the database
    def remove_blank_mods
        Modification.all.each do |mod|
            if mod.name ==""
                mod.destroy!
            end
        end
    end
    
    # Used to build search items on the index page. DRY's up the search form
    def build_search_items(model, attribute)
        model.select(attribute).distinct.collect {|entity| [entity[attribute], entity[attribute]]}
    end

    # Next two methods are used to dynamically print modifications to the show page for a listing. If new modification types are added, no modification to the show page is required.
    def return_modification_types
        return @mod_types = Modification.distinct.pluck('modification_type')
    end
    
    def return_mods(mod_type)
        if @listing
        return mods = @listing.modifications.where(modifications: { modification_type: mod_type })
        else
          return Modification.where(modifications: { modification_type: mod_type })
        end
    end

end