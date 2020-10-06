FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.name }
    last_name { FFaker::Name.name }
    address { FFaker::Address.street_address }
    country { FFaker::Address.country }
    address_type { 'billing' }
    city { FFaker::Address.city }
    zip { '29000' }
    phone { '+38000000' }
    user
  end
end
