FactoryBot.define do
  factory :payment do
    subscription { nil }
    stripe_id { "MyString" }
  end
end
