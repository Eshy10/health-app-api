FactoryBot.define do
    factory :Measurement do
      value { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
      date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
      measure_category_id { nil }
    end
  end