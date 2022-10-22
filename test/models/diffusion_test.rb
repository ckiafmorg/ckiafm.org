# frozen_string_literal: true

require 'test_helper'

class DiffusionTest < ActiveSupport::TestCase
  context '#validations' do
    should validate_presence_of :temps_debut
    should validate_presence_of :temps_fin
    should validate_presence_of :date_debut
  end

  test 'etant donne temps_debut avant temps_fin quand #valid? alors retourne true' do
    diffusion = build :diffusion

    assert diffusion.valid?
  end

  test 'etant donne temps_debut apres temps_fin quand #valid? alors retourne false' do
    diffusion = build :diffusion, temps_fin: 1.hour.ago

    assert_not diffusion.valid?
  end

  test 'etant donne un seul jour de diffusion quand #jours_diffusion alors retourne le seul jour' do
    diffusion = build :diffusion, :diffuse_seulement_lundi

    jours = diffusion.jours_diffusion

    assert_equal jours, 'lundi'
  end

  test 'etant donne deux jours de diffusion quand #jours_diffusion alors retourne les deux jours separe par "et"' do
    diffusion = build :diffusion, diffuse_lundi: true, diffuse_mardi: true

    jours = diffusion.jours_diffusion

    assert_equal jours, 'lundi et mardi'
  end

  test 'etant donne plusieurs jours de diffusion quand #jours_diffusion alors retourne une enumeration des jours de diffusion' do
    diffusion = build :diffusion, :diffuse_seulement_jours_semaine

    jours = diffusion.jours_diffusion

    assert_equal jours, 'lundi, mardi, mercredi, jeudi et vendredi'
  end
end
