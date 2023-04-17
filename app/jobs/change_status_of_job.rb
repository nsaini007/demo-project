class ChangeStatusOfJob < ApplicationJob
  queue_as :default

  def perform(recruiter_job)
    # debugger
    recruiter_job.publish!
  end
end
