# frozen_string_literal: true

FactoryBot.define do
  factory :paiement do
    membre { nil }
    amount { '9.99' }
  end
end
