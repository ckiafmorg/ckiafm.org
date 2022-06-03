# frozen_string_literal: true

FactoryBot.define do
  factory :show do
    name { Faker::Movie.title }
    description { Faker::Movie.quote }
    special { false }
    status { 'draft' }
    email { 'test@ckiafm.org' }

    trait :special do
      special { true }
    end

    trait :active do
      status { 'active' }
    end

    trait :holiday do
      status { 'holiday' }
    end

    trait :archived do
      status { 'archived' }
    end
  end
end
