# frozen_string_literal: true

FactoryBot.define do
  factory :diffusion_hebdomadaire do
    temps_debut { Time.zone.now }
    temps_fin { 1.hour.from_now }
    date_debut { Time.zone.today }
    diffuse_lundi { false }
    diffuse_mardi { false }
    diffuse_mercredi { false }
    diffuse_jeudi { false }
    diffuse_vendredi { false }
    diffuse_samedi { false }
    diffuse_dimanche { false }
    rediffusion { false }
    emission

    trait :diffuse_seulement_jours_semaine do
      diffuse_lundi { true }
      diffuse_mardi { true }
      diffuse_mercredi { true }
      diffuse_jeudi { true }
      diffuse_vendredi { true }
    end
  end
end
