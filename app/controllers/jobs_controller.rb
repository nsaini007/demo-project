class JobsController < ApplicationController
  def index
    @jobs = Job.order('created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
  end

end
