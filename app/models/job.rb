class Job < ApplicationRecord
  # attribute :user
  belongs_to :recruiter, class_name: 'User'

  before_save :check_user

  def check_user
    id = self.recruiter_id 
    user = User.find_by_id(id)
    if user.type != "Recruiter"
      raise "This is not a recruiter"
    end

    # if User.type != "Recruiter"
    #   return
    # end
  end
end
