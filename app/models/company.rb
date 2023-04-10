class Company < ApplicationRecord
    has_one :recruiter, class_name: 'User'
end
