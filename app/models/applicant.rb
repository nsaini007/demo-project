class Applicant < User
    has_one :applicant_profile, class_name: 'ApplicantProfile', foreign_key: 'applicant_id'
end