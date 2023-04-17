class Job < ApplicationRecord
  include Discard::Model
  include AASM

  belongs_to :recruiter, class_name: 'User'
  has_many :applications, dependent: :destroy
  before_validation do
    # debugger
    errors.add(:base, 'Can not update job while published') if !status_changed? && self.published?
  end
  after_commit on: :create do 
    # debugger
    ChangeStatusOfJob.set(wait: 1.minute).perform_later(self)
  end

  aasm column: 'status' do
    state :unpublished, initial: true
    state :published

    event :publish do
      transitions from: [:unpublished], to: :published
    end
  end

  def count_applicants
    self.applications.count
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "job_type", "recruiter_id", "salary", "title", "updated_at", "vacancies"]
  end

end
