class Job < ApplicationRecord
  belongs_to :recruiter, class_name: 'User'
  has_many :applications, dependent: :destroy

  def count_applicants
    self.applications.count
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "job_type", "recruiter_id", "salary", "title", "updated_at", "vacancies"]
  end
end
