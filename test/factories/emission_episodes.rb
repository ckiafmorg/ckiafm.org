# frozen_string_literal: true

FactoryBot.define do
  factory :emission_episode do
    nom { 'MyString' }
    published_at { '2024-04-11 13:43:55' }
    description { 'MyText' }
    emission { nil }
  end
end
