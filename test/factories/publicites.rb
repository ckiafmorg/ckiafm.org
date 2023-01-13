# frozen_string_literal: true

FactoryBot.define do
  factory :publicite do
    hauteur { 1 }
    largeur { 1 }
    liens { 'MyString' }
    date_debut { '2023-01-09' }
    date_fin { '2023-01-09' }
  end
end
