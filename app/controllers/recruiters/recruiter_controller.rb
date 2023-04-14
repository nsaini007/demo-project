class Recruiters::RecruiterController < Recruiters::BaseController
  before_action :authenticate_user!
  
  def index
    #any problem occurs write helpers.recruiter?
    if recruiter?
      id = current_user.id
      @recruiter_jobs = current_user.jobs.kept
    else
      redirect_to root_path, alert: "You are not a recruiter"
    end
  end
end
