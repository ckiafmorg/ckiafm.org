# frozen_string_literal: true

class Diffusion < ApplicationRecord
  belongs_to :emission

  validates :temps_debut, presence: true
  validates :temps_fin, presence: true
  validates :date_debut, presence: true

  TYPE_DIFFUSION = %i[hebdomadaire deux_semaines mensuelle speciale].freeze

  def jours_diffusion
    [diffuse_dimanche, diffuse_lundi, diffuse_mardi, diffuse_mercredi, diffuse_jeudi, diffuse_vendredi, diffuse_samedi]
  end

  def jour_de_la_semaine(jour_nombre)
    case jour_nombre
    when 0
      'Dimanche'
    when 1
      'Lundi'
    when 2
      'Mardi'
    when 3
      'Mercredi'
    when 4
      'Jeudi'
    when 5
      'Vendredi'
    when 6
      'Samedi'
    end
  end

  def self.find_programmation_de_la_journee
    all
      .filter(&:en_onde_aujourdhui?)
      .sort_by { |a| a.temps_debut.strftime('%H:%M') }
  end
end
