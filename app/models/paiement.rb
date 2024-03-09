# frozen_string_literal: true

class Paiement < ApplicationRecord
  validates :montant, presence: true, numericality: true, comparison: { greater_than: 0 }
  belongs_to :membre
end
