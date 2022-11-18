# frozen_string_literal: true

require 'test_helper'

class DiffusionMensuelleTest < ActiveSupport::TestCase
  test 'etant donne meme date que date_debut quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 26)
    travel_to Time.zone.local(2022, 11, 26)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne meme semaine mais pas meme jour quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 26)
    travel_to Time.zone.local(2022, 11, 27)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne meme mois mais pas meme semaine quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 26)
    travel_to Time.zone.local(2022, 12, 4)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne mois different et meme semaine quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 7)
    travel_to Time.zone.local(2022, 12, 5)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne mois different la meme semaine du mois pas le meme jours quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 7)
    travel_to Time.zone.local(2022, 12, 6)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne mois different pas la meme semaine quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_mensuelle, date_debut: Time.zone.local(2022, 11, 7)
    travel_to Time.zone.local(2022, 12, 12)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end
end
