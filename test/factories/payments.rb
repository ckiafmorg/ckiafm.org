# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    subscription { nil }
    stripe_id { 'MyString' }
  end
end
