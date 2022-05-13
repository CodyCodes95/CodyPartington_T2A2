class ProfilesController < ApplicationController
    include Pundit::Authorization
    before_action :check_auth
    before_action :set_user, only: [:show, :edit, :update]
    before_action :set_id, only: [:new, :edit]
    before_action :has_permission?, only: [:edit, :update, :destroy, :show]

    def index
        @profiles = Profile.all
    end

    def create
        @profile = Profile.create(profile_params)
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

    def show; end

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
        authorize Profile
    end

    def has_permission?
        if current_user.has_role? :admin
            return true
        elsif current_user.profile.id != @profile.id
            forbidden
        end
    end
end
