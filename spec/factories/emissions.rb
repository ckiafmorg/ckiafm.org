# frozen_string_literal: true

FactoryBot.define do
  factory :emission do
    nom { Faker::Movie.title }
    description { Faker::Movie.quote }
    speciale { false }
    status { 'brouillon' }
    email { 'test@ckiafm.org' }

    trait :speciale do
      speciale { true }
    end

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
