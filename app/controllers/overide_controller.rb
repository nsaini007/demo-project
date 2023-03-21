class OverideController < ApplicationController
    def after_registration_path
        confirmation_pending_path
    end
end