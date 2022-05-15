class ApplicationController < ActionController::Base
    rescue_from Pundit::NotAuthorizedError, with: :forbidden
    
    def show_error_retry(entity, page)
        flash.now[:alert] = entity.errors.full_messages.join('<br>')
        render page
    end
    
    def is_admin?
        if current_user.has_role? :admin
            return true
        end
    end

    def forbidden
        flash[:alert] = "You are not authorized to perform that action!"
        redirect_to root_path
    end
    
end
