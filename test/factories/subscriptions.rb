FactoryBot.define do
  factory :subscription do
    nom { "MyString" }
    prix_cents { 1 }
    moyen_payment { 1 }
    membres { nil }
  end
end
