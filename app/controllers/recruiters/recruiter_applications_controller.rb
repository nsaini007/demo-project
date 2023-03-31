class Recruiters::RecruiterApplicationsController < Recruiters::BaseController
  before_action :set_recruiter_applications, only: [:index, :accept, :reject]
  helper_method :accepted_applications, :rejected_applications
  def index
  end

  def accept
    @recruiter_applications.find(params[:recruiter_application_id]).accept!
  end

  def reject
    @recruiter_applications.find(params[:recruiter_application_id]).reject!
    redirect_to request.referrer
  end
  
  private

  def rejected_applications
    @recruiter_applications.rejected    
  end
  
  def accepted_applications
    @recruiter_applications.accepted
  end

  def set_recruiter_applications
    @recruiter_applications = current_user.jobs.find(params[:id]).applications
  end
end
