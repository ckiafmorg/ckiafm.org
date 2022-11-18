# frozen_string_literal: true

require 'test_helper'

class DiffusionHebdomadaireTest < ActiveSupport::TestCase
  test 'etant donne un seul jour de diffusion et date_debut est aujourdhui quand #jours_diffusion_formate alors retourne le seul jour' do
    diffusion = build :diffusion_hebdomadaire, diffuse_lundi: true

    jours = diffusion.jours_diffusion_formate

    assert_equal jours, 'lundi'
  end

  test 'etant donne deux jours de diffusion quand #jours_diffusion_formate alors retourne les deux jours separe par "et"' do
    diffusion = build :diffusion_hebdomadaire, diffuse_lundi: true, diffuse_mardi: true

    jours = diffusion.jours_diffusion_formate

    assert_equal jours, 'lundi et mardi'
  end

  test 'etant donne plusieurs jours de diffusion quand #jours_diffusion_formate alors retourne une enumeration des jours de diffusion' do
    diffusion = build :diffusion_hebdomadaire, :diffuse_seulement_jours_semaine

    jours = diffusion.jours_diffusion_formate

    assert_equal jours, 'lundi, mardi, mercredi, jeudi et vendredi'
  end

  test 'etant donne diffusion hebdo et date_debut est dans le futur quand #en_onde_aujourdhui? alord retourne false' do
    diffusion = build :diffusion_hebdomadaire, diffuse_lundi: true, date_debut: Time.zone.local(2022, 11, 15)
    travel_to Time.zone.local(2022, 11, 14)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne diffusion hebdo diffuse lundi et nous sommes lundi quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_hebdomadaire, diffuse_lundi: true, date_debut: Time.zone.local(2022, 11, 14)
    travel_to Time.zone.local(2022, 11, 14)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne diffusion hebdo diffuse lundi et nous sommes mardi quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_hebdomadaire, diffuse_lundi: true
    travel_to Time.zone.local(2022, 11, 15)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end
end
