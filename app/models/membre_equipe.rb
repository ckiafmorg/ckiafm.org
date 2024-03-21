# frozen_string_literal: true

class MembreEquipe < ApplicationRecord
  validates :nom, presence: true
  validates :role, presence: true
  belongs_to :emission
end
