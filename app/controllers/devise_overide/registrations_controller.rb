class DeviseOveride::RegistrationsController < Devise::RegistrationsController
    
    def after_inactive_sign_up_path_for(resource)
        "/confirmation_pending"
    end
    
end