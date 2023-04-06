class Recruiters::RecruiterJobsController < Recruiters::BaseController
  before_action :set_recruiter_job, only: [:edit, :update, :destroy]
  # helper_method :count_applicants

    # def index
    #   if helpers.recruiter?
    #     id = current_user.id
    #     @recruiter_jobs = current_user.jobs.discarded
    #   else
    #     "nothing"#to be resolved
    #   end
    # end

    def new
      @recruiter_job = Job.new
    end
  
    def create
      @recruiter_job = current_user.jobs.create(job_params)
      if @recruiter_job.save
        redirect_to recruiter_index_path
      else
        render :new
      end
    end

    def edit
      # @job = current_user.jobs.find_by_id(params[:id])
    end
    
    def update
      if set_recruiter_job.update(job_params)
        redirect_to recruiter_index_path, notice: "Job has been updated successfully"
      else
        render :edit
      end
    end
    
    def destroy
      # @job = current_user.jobs.find_by_id(params[:id])
      if @recruiter_job.discard
        # redirect_to recruiter_index_path, notice: "Job has beeen deleted successfully"
      else
        
      end
    end
  
    private
      # def count_applicants
      #   @recruiter_job.applications.count
      # end

      def job_params
        params.require(:job).permit(:title, :description, :vacancies, :salary, :job_type)
      end
  
      def set_recruiter_job
        @recruiter_job = current_user.jobs.find(params[:id])
      end
end
