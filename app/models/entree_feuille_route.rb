# frozen_string_literal: true

class EntreeFeuilleRoute < ApplicationRecord
  VOCALS = { french: 0, english: 1, other_vocal: 100 }.freeze
  enum :vocal, VOCALS

  ORIGINES = { canada: 0, other_origine: 100 }.freeze
  enum :origine, ORIGINES

  SOURCES = { micro: 0, cd: 1, jazler: 2, other_source: 100 }.freeze
  enum :source, SOURCES

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

  belongs_to :emission_episode

  validates :vocal, presence: true, inclusion: { in: vocals.keys }
end
