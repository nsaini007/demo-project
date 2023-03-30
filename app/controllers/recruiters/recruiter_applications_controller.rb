class Recruiters::RecruiterApplicationsController < Recruiters::BaseController
  before_action :set_recruiter_applications, only: [:index]
  def index
  end

  def accept
    @recruiter_applications.accept!
  end

  def reject
    @recruiter_applications.reject!
  end

  private

  def set_recruiter_applications
    @recruiter_applications = current_user.jobs.find(params[:id]).applications
  end
end
