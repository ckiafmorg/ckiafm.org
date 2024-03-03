# frozen_string_literal: true

FactoryBot.define do
  factory :membre do
    prenom { 'MyString' }
    nom { 'MyString' }
    email { 'MyString' }
    phone { 'MyString' }
    adresse { 'MyString' }
    code_postal { 'MyString' }
    ville { 'MyString' }
    province { 'MyString' }
    pays { 'MyString' }
  end
end
