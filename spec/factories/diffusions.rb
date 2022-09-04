# frozen_string_literal: true

FactoryBot.define do
  factory :diffusion do
    debut_heure { 1 }
    debut_minute { 0 }
    fin_heure { 5 }
    fin_minute { 0 }
    diffuse_lundi { false }
    diffuse_mardi { false }
    diffuse_mercredi { false }
    diffuse_jeudi { false }
    diffuse_vendredi { false }
    diffuse_samedi { false }
    diffuse_dimanche { false }
    redifussion { false }
    emission

    trait :all_week_show do
      diffuse_lundi { true }
      diffuse_mardi { true }
      diffuse_mercredi { true }
      diffuse_jeudi { true }
      diffuse_vendredi { true }
    end
  end
end
