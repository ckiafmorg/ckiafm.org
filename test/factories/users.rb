# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Alphanumeric.alphanumeric(number: 24) }
    role { :producer }

    trait :admin do
      role { :admin }
    end
  end
end
