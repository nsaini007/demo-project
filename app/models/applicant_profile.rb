class ApplicantProfile < ApplicationRecord
    belongs_to :applicant, class_name: 'Applicant'
    has_one_attached :resume
end
