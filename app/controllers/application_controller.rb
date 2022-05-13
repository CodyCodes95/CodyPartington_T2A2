class ApplicationController < ActionController::Base
    def show_error_retry(entity, page)
        flash.now[:alert] = entity.errors.full_messages.join('<br>')
        render page
    end

rescue_from Pundit::NotAuthorizedError, with: :forbidden

 private

def forbidden
    flash[:alert] = "You are not authorized to perform that action!"
    redirect_to root_path
end

end
