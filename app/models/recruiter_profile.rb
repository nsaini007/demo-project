class RecruiterProfile < ApplicationRecord
  belongs_to :recruiter, class_name: 'Recruiter'
  belongs_to :company
end
