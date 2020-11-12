FactoryBot.define do
  factory :credit_card do
    name { FFaker::Name.name }
    number { FFaker::Number.number(digits: 16) }
    date { '10/22' }
    cvv { FFaker::Number.number(digits: 3) }
    order
  end
end
