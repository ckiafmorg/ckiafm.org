# frozen_string_literal: true

FactoryBot.define do
  factory :emission do
    nom { Faker::Movie.title }
    description { Faker::Movie.quote }
    status { 'brouillon' }
    email { 'test@ckiafm.org' }

    trait :active do
      status { 'active' }
    end

    trait :vacance do
      status { 'vacance' }
    end

    trait :archive do
      status { 'archive' }
    end
  end
end
