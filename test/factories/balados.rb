# frozen_string_literal: true

FactoryBot.define do
  factory :balado do
    titre { Faker::Name.unique.name }
    description { Faker::Lorem.paragraphs }
    published_at { '2024-06-14' }
    email { Faker::Internet.email }
    status { 1 }

    trait :draft do
      status { 0 }
    end
  end
end
