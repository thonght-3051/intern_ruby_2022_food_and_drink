FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name}
    phone { Faker::PhoneNumber.subscriber_number(length: 10) }
    email { Faker::Internet.email }
    password_digest { "123123" }
    role { 2 }
    status { 1 }
  end
end
