FactoryBot.define do
  factory :product do
    name { Faker::Name.unique.name}
    description { Faker::Lorem.paragraph_by_chars(number: 210) }
    category { FactoryBot.create :category }
  end
end
