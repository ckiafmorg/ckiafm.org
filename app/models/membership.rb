# frozen_string_literal: true

class Membership < ApplicationRecord
  RECCURENCE = %i[mensuel annuel].freeze
  enum :reccurence, RECCURENCE

  validates :nom, presence: true, uniqueness: true
  validates :montant, presence: true, numericality: true, comparison: { greater_than: 0 }
  validates :reccurence, presence: true, inclusion: { in: reccurences.keys }

  has_many :membres, dependent: :restrict_with_exception
end
