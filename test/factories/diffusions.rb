# frozen_string_literal: true

FactoryBot.define do
  # TODO: create other factories for the other type of diffusion
  factory :diffusion do
    temps_debut { "#{Time.zone.now.hour}:#{Time.zone.now.min}:#{Time.zone.now.sec}" }
    temps_fin { "#{Time.zone.now.hour + 1}:#{Time.zone.now.min}:#{Time.zone.now.sec}" }
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
