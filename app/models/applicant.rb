class Applicant < User
    has_one :applicant_profile, class_name: 'ApplicantProfile', foreign_key: 'applicant_id'
    has_many :applications, class_name: 'Application', foreign_key: 'applicant_id'
end