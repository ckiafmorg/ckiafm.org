# frozen_string_literal: true

class Membre < ApplicationRecord
  STATUS = %w[active unactive].freeze

  validates :nom, presence: true
  validates :prenom, presence: true
  validates :email, presence: true

  def active?; end
end
