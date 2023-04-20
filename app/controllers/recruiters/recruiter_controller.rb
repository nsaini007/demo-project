class Recruiters::RecruiterController < Recruiters::BaseController

  def index
      @recruiter_jobs = current_user.jobs.kept.order('created_at DESC')
  end
end
