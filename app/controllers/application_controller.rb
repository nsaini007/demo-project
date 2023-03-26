class ApplicationController < ActionController::Base
    #not working why i don't know
    rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :first_name, :last_name])
    end

    private
    def record_not_found
        redirect_to root_path, alert: "Project does not exist with the given id"
    end
end
