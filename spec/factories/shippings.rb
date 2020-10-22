FactoryBot.define do
  factory :shipping do
    from_days { rand(1..3) }
    to_days { rand(4..10) }
    price { rand(10..25) }
  end
end
