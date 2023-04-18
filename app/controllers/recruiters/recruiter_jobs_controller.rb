class Recruiters::RecruiterJobsController < Recruiters::BaseController
  before_action :set_recruiter_job, only: [:edit, :update, :destroy]

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

    def edit;end
    
    def update
      if set_recruiter_job.update(job_params)
        redirect_to recruiter_index_path, notice: "Job has been updated successfully"
      else
        render :edit
      end
    end
    
    def destroy
      if @recruiter_job.discard
        respond_to do |format|
          format.html { redirect_to recruiter_index_path }
          format.json { render :json => {:message => "success", :body => @recruiter_job} }
        end
      else
        respond_to do |format|
          format.html { redirect_to request.env["HTTP_REFERER"], notice: "Cannot perform action!"  }
          format.json { render :json => {:message => "false"} }
        end        
      end
    end
  
    private
      def job_params
        params.require(:job).permit(:title, :description, :vacancies, :salary, :job_type)
      end
  
      def set_recruiter_job
        @recruiter_job = current_user.jobs.find(params[:id])
      end
end
