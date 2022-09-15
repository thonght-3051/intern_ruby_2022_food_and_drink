FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name}
    phone { Faker::PhoneNumber.subscriber_number(length: 10) }
    email { Faker::Internet.email }
    password {"123@123Ab"}
    password_confirmation {"123@123Ab"}
    role { 2 }
    status { 1 }
  end
end
