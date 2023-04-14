class Applicant < User
    has_one :applicant_profile, class_name: 'ApplicantProfile', foreign_key: 'applicant_id'
    has_many :applications, class_name: 'Application', foreign_key: 'applicant_id'
    after_commit on: :create do
        self.create_applicant_profile
    end
end