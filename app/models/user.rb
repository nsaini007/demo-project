class User < ApplicationRecord
  has_one_attached :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  validates :type,:first_name, :last_name,  presence: true

  validate :check_type

  after_create :create_applicant_profile

  
  def name
    return "#{self.first_name} #{self.last_name}".strip
  end

  private
  def check_type
      unless self.type == "Applicant" or self.type == "Recruiter"
        self.errors.add(:type, "Not a valid type")
      end 
  end

  def create_applicant_profile
    if self.type == "Applicant"
      self.applicant_profile.create      
    end
  end

end
