# frozen_string_literal: true

require 'test_helper'

class DiffusionTest < ActiveSupport::TestCase
  test 'etant donne type_diffusion hebdomadaire quand #create_for alors retourne DiffusionHebdomadaire' do
    diffusion = DiffusionFactory.create_for(:hebdomadaire, attributes_for(:diffusion_hebdomadaire))

    assert diffusion.instance_of? DiffusionHebdomadaire
  end

  test 'etant donne type_diffusion deux_semaines quand #create_for alors retourne DiffusionDeuxSemaines' do
    diffusion = DiffusionFactory.create_for(:deux_semaines, attributes_for(:diffusion_deux_semaines))

    assert diffusion.instance_of? DiffusionDeuxSemaines
  end

  test 'etant donne type_diffusion mensuelle quand #create_for alors retourne DiffusionMensuelle' do
    diffusion = DiffusionFactory.create_for(:mensuelle, attributes_for(:diffusion_mensuelle))

    assert diffusion.instance_of? DiffusionMensuelle
  end

  test 'etant donne type_diffusion speciale quand #create_for alors retourne DiffusionSpeciale' do
    diffusion = DiffusionFactory.create_for(:speciale, attributes_for(:diffusion_speciale))

    assert diffusion.instance_of? DiffusionSpeciale
  end
end
