class Recruiters::RecruiterController < Recruiters::BaseController
  before_action :authenticate_user!
  
  def index
    #any problem occurs write helpers.recruiter?
      @recruiter_jobs = current_user.jobs.kept.order('created_at DESC')
  end
end
