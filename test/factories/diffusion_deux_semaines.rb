# frozen_string_literal: true

FactoryBot.define do
  factory :diffusion_deux_semaines do
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
  end
end
