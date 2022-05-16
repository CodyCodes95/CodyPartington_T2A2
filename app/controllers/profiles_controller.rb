class ProfilesController < ApplicationController
    include Pundit::Authorization
     rescue_from Pundit::NotAuthorizedError, with: :forbidden
     before_action :authenticate_user!
     before_action :set_user, only: [:show, :edit, :update]
     before_action :check_auth, except: [:index]
    before_action :set_id, only: [:new, :edit]

    def index
        if current_user.has_role? :admin
        @profiles = Profile.all
        else
            @profile = current_user.profile
            check_auth
        end
    end

    def create
        @profile = Profile.create!(profile_params)
        if @profile.valid?
        redirect_to @profile
        else
      show_error_retry(@profile, 'new')
        end
    end

    def new
        @profile = Profile.new
        @profile.build_address
    end

    def show;
     end

    def edit; end

    def update
        @profile.update(profile_params)
        if @profile.valid?
        redirect_to @profile
        else
      show_error_retry(@profile, 'edit')
        end
    end

  private

    def profile_params
        params.require(:profile).permit(:user_id, :first_name, :last_name, :date_of_birth, :avatar,
            address_attributes: [:id, :street_number, :street_name, :city, :state, :postcode, :country])
    end

    def set_user
        @profile = Profile.find(params[:id])
    end

    def set_id
        @id = current_user.id
    end

    def check_auth
        if current_user && current_user.profile != nil
        authorize @profile
        else
            authorize Profile
        end
    end

end
