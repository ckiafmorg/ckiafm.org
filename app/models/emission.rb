# frozen_string_literal: true

class Emission < ApplicationRecord
  STATUS = { brouillon: 0, active: 1, vacance: 2, archive: 3 }.freeze
  enum status: STATUS

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :email, email: true, presence: true

  has_many :unit_ressource_locators, dependent: :destroy
  has_many :compte_media_sociauxes, through: :unit_ressource_locators
end
