class ProfilesController < ApplicationController

    before_action :set_user

    def index
        @profiles = Profile.all
    end

    def create
        @profile = Profile.create(profile_params)
        if @profile.valid?
        redirect_to @profile
        else
      flash.now[:alert] = @profile.errors.full_messages.join('<br>')
      render 'new'
        end
    end

    def new
        @profile = Profile.new
        @profile.build_address
    end

    def show
        @profile = current_user.profile
    end

    def edit

    end

    def update
        @profile = current_user.profile
        @profile.update(profile_params)
        if @profile.valid?
        redirect_to @profile
        else
      flash.now[:alert] = @profile.errors.full_messages.join('<br>')
      render 'edit'
        end

    end

    private
    
    def profile_params
        params.require(:profile).permit(:user_id, :first_name, :last_name, :date_of_birth, :avatar, address_attributes: [:id, :street_number,:street_name, :city, :state, :postcode, :country])
    end

    def set_user
        @id = current_user.id
        @user = current_user
        @profile = current_user.profile
    end

end

