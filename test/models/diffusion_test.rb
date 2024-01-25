# frozen_string_literal: true

require 'test_helper'

class DiffusionTest < ActiveSupport::TestCase
  context '#validations' do
    should validate_presence_of :temps_debut
    should validate_presence_of :temps_fin
    should validate_presence_of :date_debut
  end

  test 'quand #jours_diffusion alors retourne una array de boolean si diffuse ou non ou index zero est dimanche' do
    diffusion = build(:diffusion, diffuse_mardi: true, diffuse_mercredi: true)

    jours = diffusion.jours_diffusion

    assert_equal jours, [false, false, true, true, false, false, false]
  end
end
