# frozen_string_literal: true

class CategorieEmission < ApplicationRecord
  validates :nom, presence: true
  validates :couleur, presence: true

  has_many :emission, dependent: :nullify
end
