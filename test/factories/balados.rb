# frozen_string_literal: true

FactoryBot.define do
  factory :balado do
    titre { 'MyString' }
    description { 'MyText' }
    published_at { '2024-06-14 14:46:23' }
    email { 'MyString' }
    slug { 'MyString' }
    status { 1 }
  end
end
