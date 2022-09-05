FactoryBot.define do
  factory :category do
    name { Faker::Name.unique.name}
    status { rand(0...1) }
  end
end
