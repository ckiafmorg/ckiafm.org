# frozen_string_literal: true

FactoryBot.define do
  factory :episode_balado do
    titre { 'MyString' }
    description { 'MyText' }
    published_at { '2024-06-14 15:29:08' }
    status { 1 }
    balado { nil }
  end
end
