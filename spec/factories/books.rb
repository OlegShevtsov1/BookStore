FactoryBot.define do
  factory :book do
    name { FFaker::Book.title }
    description { FFaker::Book.description(3) }
    trait :with_short_description do
      description { FFaker::Book.description(1) }
    end
    trait :with_long_description do
      description { FFaker::Book.description(10) }
    end
    price { 32.9 }
    year { 2016 }
    heigth { 6.4 }
    width { 0.9 }
    depth { 5.0 }
    material { 'Hardcove, glossy paper' }

    category
  end
end
