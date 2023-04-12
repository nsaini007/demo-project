FactoryBot.define do
  factory :application do
    job { create(:job) }
    applicant { create(:applicant) }
    # association :job, factory: :job
    # association :applicant, factory: :applicant
    resume { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'resume.pdf'), 'application/pdf') }
    status { 'applied' }
  end
end
