class Recruiter < User
    has_many :jobs, class_name: 'Job', foreign_key: 'recruiter_id'
    has_one :recruiter_profile, class_name: 'RecruiterProfile', foreign_key: 'recruiter_id'
end