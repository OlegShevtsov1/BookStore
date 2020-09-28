FactoryBot.define do
  factory :user do |f|
    f.sequence(:email) { |n| "user#{n}@gmail.com" }
    password { 'As12345678' }

    confirmed_at { Time.current }
  end
end
