# frozen_string_literal: true

FactoryBot.define do
  factory :emission do
    nom { Faker::Movie.title }
    description { Faker::Movie.quote }
    status { 'draft' }
    email { 'test@ckiafm.org' }
    categorie_emission

    trait :active do
      status { 'live' }
    end

    trait :vacance do
      status { 'vacation' }
    end

    trait :archive do
      status { 'archived' }
    end
  end
end
