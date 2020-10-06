FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    email { "example@gmail.com" }
    password_digest { "example" }
  end
end
