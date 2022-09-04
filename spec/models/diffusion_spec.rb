# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diffusion, type: :model do
  describe 'validations' do
    subject(:diffusion) { build :diffusion, debut_heure: 2 }

    it { is_expected.to validate_presence_of :debut_heure }
    it { is_expected.to validate_presence_of :debut_minute }
    it { is_expected.to validate_presence_of :fin_heure }
    it { is_expected.to validate_presence_of :fin_minute }

    describe 'debut diffusion doit toujours etre avant fin diffusion' do
      context 'diffusion est valide quand' do
        it 'debut_heure est plus petit que fin_heure' do
          diffusion = build :diffusion, debut_heure: 2, fin_heure: 4

          expect(diffusion).to be_valid
        end

        it 'debut_heure est egal a fin_heure et debut_minute est plus petit que fin_minute' do
          diffusion = build :diffusion, debut_heure: 2, debut_minute: 0, fin_heure: 2, fin_minute: 15

          expect(diffusion).to be_valid
        end
      end

      context 'diffusion est invalide quand' do
        it 'debut_heure est plus grand que fin_heure' do
          diffusion = build :diffusion, debut_heure: 4, fin_heure: 2

          expect(diffusion).not_to be_valid
        end

        it 'debut_heure ext egal a fin_heure et debut_minute est plus grand que fin_minute' do
          diffusion = build :diffusion, debut_heure: 2, debut_minute: 15, fin_heure: 2, fin_minute: 0

          expect(diffusion).not_to be_valid
        end
      end
    end
  end
end
