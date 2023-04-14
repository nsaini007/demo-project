class Recruiters::RecruiterProfileController < Recruiters::BaseController
    before_action :set_profile, only: [:show, :edit]
    def show
    # @profile = current_user.Recruiter_profile
    end

    def new
    @profile = RecruiterProfile.new
    end

    def create
    # @profile = RecruiterProfile.create(recruiter_id: current_user.id, company_id: profile_params)
    @profile = current_user.create_recruiter_profile(profile_params)
    if @profile.save
        redirect_to recruiter_index_path
    else
        render :new
    end
    end

    def edit;end

    def update
    if set_profile.update(profile_params)
        redirect_to recruiter_profile_path, notice: "profile has been updated successfully"
    else
        redirect_to recruiter_profile_path, notice: "Error in updating profile"
    end
    end

    private
    def profile_params
        params.require(:recruiter_profile).permit(:company_id)
    end

    def set_profile
        @profile = current_user.recruiter_profile
    end
end
