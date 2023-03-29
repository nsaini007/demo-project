class JobsController < ApplicationController
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result.order('created_at DESC')
    # @jobs = Job.order('created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
  end



end
