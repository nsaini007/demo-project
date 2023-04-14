class JobsController < ApplicationController
  layout :choose_layout

  def choose_layout
    if applicant?
      'applicant'      
    elsif recruiter?
      'recruiter'
    else
      'application'
    end
  end

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result.kept.order('created_at DESC')
    # @jobs = Job.order('created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
  end
  
end
