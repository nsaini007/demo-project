class Recruiters::RecruiterApplicationsController < Recruiters::BaseController
  def index
    @recruiter_applications = current_user.jobs.find(params[:id]).applications
  end
end
