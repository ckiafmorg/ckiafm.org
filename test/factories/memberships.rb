# frozen_string_literal: true

FactoryBot.define do
  factory :membership do
    nom { 'MyString' }
    montant { '9.99' }
    reccurence { 1 }
  end
end
