class ApplicationsController < ApplicationController
    before_action :authenticate_user!
    def new
        @application = current_user.applications.new
    end

    def create
        @application = current_user.applications.create(application_params)
        if @application.save
            redirect_to job_path(id: params[:job_id]), alert: "Job applied successfully"
        else
            redirect_to job_path(id: params[:job_id]), alert: "You have already applied to this job"
        end
    end

    private
        def application_params
            # params.permit(:job_id)
            params.permit(:job_id, :resume)
        end
end
