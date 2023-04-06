class ApplicantProfile < ApplicationRecord
    belongs_to :applicant, class_name: 'Applicant'
    has_one_attached :resume
    before_validation :check_skills
    SKILLS = %i[Ruby Rails Python Django React MERN DevOPS AWS Java SpringBoot]

    def check_skills
        self.skills = YAML.load(self.skills).compact_blank
    end
end
