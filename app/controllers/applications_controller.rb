class ApplicationsController < ApplicationController
    def new
        @application = current_user.applications.new
    end

    def create
        @application = current_user.applications.create(application_params)
        if @application.save
            redirect_to root_path, notice: "Job applied successfully"
        else
            
        end
    end

    private
        def application_params
            # params.permit(:job_id)
            params.permit(:job_id, :resume)
        end
end
