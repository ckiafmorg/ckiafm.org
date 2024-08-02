# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    titre { Faker::Book.title }
    contenu { Faker::Markdown.random }
    published_at { Faker::Date.in_date_period }
    status { :published }

    trait :draft do
      status { :draft }
    end
  end
end
