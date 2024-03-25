# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    titre { 'MyString' }
    contenu { 'MyText' }
    published_at { '2024-03-21 16:50:45' }
    status { 1 }
  end
end
