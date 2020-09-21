FactoryBot.define do
  factory :comment do
    title { FFaker::Book.title }
    review { FFaker::Book.description(2) }
    status { 1 }
    score { 3 }
    book
    user
  end
end
