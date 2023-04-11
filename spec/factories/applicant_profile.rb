FactoryBot.define do
    factory :applicant_profile do
        applicant_id { create(:user) }
        skills { [] }
    end
end