FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    trait :with_demographics do
      race
      gender
      affiliation
    end
  end
end
