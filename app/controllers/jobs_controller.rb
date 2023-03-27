class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :destroy]

  def index
    @jobs = Job.order('created_at DESC')
  end

  def show
    # @job = current_user.jobs.find_by_id(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.create!(job_params)
    if @job.save
      redirect_to recruiter_index_path
    else
      render :new
    end
  end
  def edit
    # @job = current_user.jobs.find_by_id(params[:id])
  end
  
  def update
    if set_job.update(job_params)
      redirect_to recruiter_index_path, notice: "Job has been updated successfully"
    else
      render :edit
    end
  end
  
  def destroy
    # @job = current_user.jobs.find_by_id(params[:id])
    if @job.delete
      redirect_to recruiter_index_path, notice: "Job has beeen deleted successfully"
    else
      
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :description, :vacancies, :salary, :job_type)
    end

    def set_job
      @job = current_user.jobs.find(params[:id])
    end
end
