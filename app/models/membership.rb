# frozen_string_literal: true

class Membership < ApplicationRecord
  validates :nom, presence: true, uniqueness: true
  validates :montant, presence: true, numericality: true, comparison: { greater_than: 0 }

  has_many :membres, dependent: :restrict_with_exception
end
