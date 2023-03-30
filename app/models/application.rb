class Application < ApplicationRecord
  belongs_to :job
  belongs_to :applicant, class_name: 'User'
  has_one_attached :resume

  validates :applicant_id, uniqueness: { scope: :job_id }

  include AASM

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
end
