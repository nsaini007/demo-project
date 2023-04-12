FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    job_type { "Full time" }
    salary { Faker::Number.between(from: 10000, to: 50000) }
    vacancies { Faker::Number.between(from: 1, to: 10) }
    recruiter { create(:recruiter) }
  end

  
end
