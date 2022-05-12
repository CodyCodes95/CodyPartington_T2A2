class ApplicationController < ActionController::Base
    def show_error_retry(entity, page)
        flash.now[:alert] = entity.errors.full_messages.join('<br>')
        render page
    end
end
