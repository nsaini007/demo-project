FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    email {Faker::Internet.email}
    phone { Faker::PhoneNumber.cell_phone.to_i}
    password {"123456"}
    password_confirmation {"123456"}
    type {"Applicant"}

  end

  factory :applicant do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    email {Faker::Internet.email}
    phone { Faker::PhoneNumber.cell_phone.to_i}
    password {"123456"}
    password_confirmation {"123456"}

  end

  factory :recruiter do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    email {Faker::Internet.email}
    phone { Faker::PhoneNumber.cell_phone.to_i}
    password {"123456"}
    password_confirmation {"123456"}

  end
end
