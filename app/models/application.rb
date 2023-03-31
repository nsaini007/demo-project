class Application < ApplicationRecord
  include AASM

  belongs_to :job
  belongs_to :applicant, class_name: 'User'
  has_one_attached :resume

  validates :applicant_id, uniqueness: { scope: :job_id }


  aasm column: 'status' do
    state :applied, initial: true
    state :accepted
    state :rejected

    event :accept do
      transitions from: [:applied], to: :accepted
    end
    event :reject do
      transitions from: [:applied], to: :rejected
    end
  end

  # scope :find_accepted, -> (job_id) {where(status: "accepted", job_id: job_id)}
  scope :applied,  ->  { where(status: "applied") }
  scope :accepted, ->  { where(status: "accepted") }
  scope :rejected, ->  { where(status: "rejected") }
end
