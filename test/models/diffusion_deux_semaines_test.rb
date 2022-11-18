# frozen_string_literal: true

require 'test_helper'

class DiffusionDeuxSemainesTest < ActiveSupport::TestCase
  test 'etant donne meme nous sommes date debut quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 11, 19)
    travel_to Time.zone.local(2022, 11, 19)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne un nombre de semaine paire apres date_debut quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 11, 19)
    travel_to Time.zone.local(2022, 12, 3)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne un nombre de semaine impaire apres date_debut quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 11, 19)
    travel_to Time.zone.local(2022, 11, 26)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne un nombre de semaine pair dans une autre annee quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 12, 31)
    travel_to Time.zone.local(2023, 1, 14)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne un nombre de semaine impair dans une autre annee quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 12, 31)
    travel_to Time.zone.local(2023, 1, 7)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne un nombre de semaine pair plusieurs annees plus tard quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 12, 31)
    travel_to Time.zone.local(2024, 1, 13)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne un nombre de semaine impair plusieurs annees plus tard quand #en_onde_aujourdhui? alors retourne false' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 12, 31)
    travel_to Time.zone.local(2024, 1, 6)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end

  test 'etant donne semaine de diffusion et meme jour de semaine que date_debut quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 11, 19)
    travel_to Time.zone.local(2022, 11, 19)

    en_onde = diffusion.en_onde_aujourdhui?

    assert en_onde
  end

  test 'etant donne semaine de diffusion et pas meme jour de semaine que date_debut quand #en_onde_aujourdhui? alors retourne true' do
    diffusion = build :diffusion_deux_semaines, date_debut: Time.zone.local(2022, 11, 19)
    travel_to Time.zone.local(2022, 11, 20)

    en_onde = diffusion.en_onde_aujourdhui?

    assert_not en_onde
  end
end
