class Recruiter < User
    has_many :jobs, class_name: 'Job', foreign_key: 'recruiter_id'
end