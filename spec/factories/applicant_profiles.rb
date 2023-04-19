FactoryBot.define do
  factory :applicant_profile do
    applicant
    resume { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'resume.pdf'), 'application/pdf') }
    skills { ApplicantProfile::SKILLS.sample(3) }
    # skills { [] }
  end
end


