class Application < ApplicationRecord
  belongs_to :job
  belongs_to :applicant, class_name: 'User'
  has_one_attached :resume

  validates :applicant_id, uniqueness: { scope: :job_id }
end
