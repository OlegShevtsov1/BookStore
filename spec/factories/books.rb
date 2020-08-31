FactoryBot.define do
  factory :book do
    name { FFaker::Book.title }
    description { FFaker::Book.description(3) }

    category
  end
end
