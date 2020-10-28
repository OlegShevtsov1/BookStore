FactoryBot.define do
  factory :coupon do
    discount { 10..20 }
    code { FFaker::Name.name }
    order
  end
end
