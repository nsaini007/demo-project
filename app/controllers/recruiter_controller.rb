class RecruiterController < ApplicationController
  def index
    if helpers.recruiter?
      id = current_user.id
      @recruiter_jobs = current_user.jobs
    else
      "nothing"#to be resolved
    end
  end
end
