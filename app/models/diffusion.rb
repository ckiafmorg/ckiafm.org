# frozen_string_literal: true

class Diffusion < ApplicationRecord
  belongs_to :emission

  # This usage of `composed_of` is a hack to use a value object
  composed_of :debut,
              class_name: 'NaiveTime',
              mapping: [%w[temps_debut temps_debut]],
              constructor: ->(temps_debut) { NaiveTime.from_str(temps_debut) },
              converter: ->(value) { value.to_s }

  # This usage of `composed_of` is a hack to use a value object
  composed_of :fin,
              class_name: 'NaiveTime',
              mapping: [%w[temps_debut temps_debut]],
              constructor: ->(temps_fin) { NaiveTime.from_str(temps_fin) },
              converter: ->(value) { value.to_s }

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

  def en_cours_de_diffusion?
    return false unless en_onde_aujourdhui?

    current_time = NaiveTime.now

    current_time.between?(debut, fin)
  end

  def self.find_programmation_de_la_journee
    includes(:emission)
      .filter(&:en_onde_aujourdhui?)
      .sort_by(&:temps_debut)
  end

  def self.find_diffusion_en_cours
    all
      .filter(&:en_cours_de_diffusion?)
  end
end
