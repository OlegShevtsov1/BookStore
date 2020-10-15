FactoryBot.define do
  factory :book_image do
    image_data { TestData.image_data }
    book
  end
end
