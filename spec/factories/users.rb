FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    email { "example@gmail.com" }
    password { "example" }
    password_confirmation { "example" }
  end
end
