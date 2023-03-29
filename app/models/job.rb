class Job < ApplicationRecord
  belongs_to :recruiter, class_name: 'User'
  has_many :applications
end
