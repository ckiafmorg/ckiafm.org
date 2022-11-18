# frozen_string_literal: true

require 'test_helper'

class DiffusionSpecialeTest < ActiveSupport::TestCase
  test "etant donne diffusion_speciale est aujourd'hui alors #en_onde_aujourdhui? retourne true" do
    diffusion = build :diffusion_speciale

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne diffusion speciale est demain alors #en_onde_aujourdhui? retourne false' do
    diffusion = build :diffusion_speciale, date_debut: Time.zone.tomorrow

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end
end
