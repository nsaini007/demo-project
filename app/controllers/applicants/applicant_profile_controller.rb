class Applicants::ApplicantProfileController < Applicants::BaseController
  before_action :set_profile, only: [:show, :edit]
  def show
    # @profile = current_user.applicant_profile
  end

  def new
    @profile = ApplicantProfile.new
  end

  def create
    @profile = current_user.applicant_profile.create!(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if set_profile.update(profile_params)
      redirect_to applicant_profile_path, notice: "profile has been updated successfully"
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:applicant_profile).permit(:resume, skills:[])
    end

    def set_profile
      @profile = current_user.applicant_profile
    end
end
