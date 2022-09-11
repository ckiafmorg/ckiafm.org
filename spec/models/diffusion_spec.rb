# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Diffusion, type: :model do
  describe 'validations' do
    describe 'debut diffusion doit toujours etre avant fin diffusion' do
      context 'diffusion est valide quand' do
        it 'temps_debut est avant temps_fin' do
          diffusion = build :diffusion

          expect(diffusion).to be_valid
        end
      end

      context 'diffusion est invalide quand' do
        it 'debut_heure est plus grand que fin_heure' do
          diffusion = build :diffusion, temps_fin: 1.hour.ago

          expect(diffusion).not_to be_valid
        end
      end
    end
  end

  describe '#jours_diffusion' do
    it "retourne uniquement le jour s'il n'y en qu'un seul" do
      diffusion = build :diffusion, :diffuse_seulement_lundi

      jours = diffusion.jours_diffusion

      expect(jours).to eq 'lundi'
    end

    it "retourne une enumeration sans virgule s'il y a que deux jours" do
      diffusion = build :diffusion, diffuse_lundi: true, diffuse_mardi: true

      jours = diffusion.jours_diffusion

      expect(jours).to eq 'lundi et mardi'
    end

    it 'retourne une string énumérant tous les jours de diffusion' do
      diffusion = build :diffusion, :diffuse_seulement_jours_semaine

      jours = diffusion.jours_diffusion

      expect(jours).to eq 'lundi, mardi, mercredi, jeudi et vendredi'
    end
  end
end
