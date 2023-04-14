class ApplicantProfile < ApplicationRecord
    belongs_to :applicant, class_name: 'Applicant'
    has_one_attached :resume
    before_validation :check_skills
    validate :correct_document_type
    SKILLS = %i[Ruby Rails Python Django React MERN DevOPS AWS Java SpringBoot]

    def check_skills
        self.skills = self.skills.compact_blank
    end

    private
    def correct_document_type
        if resume.attached? && !resume.content_type.in?(%w(application/msword application/pdf))
            errors.add(:document, 'Must be a valid image file')
        end
    end
end
