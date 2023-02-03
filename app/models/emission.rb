# frozen_string_literal: true

class Emission < ApplicationRecord
  STATUS = { brouillon: 0, active: 1, vacance: 2, archive: 3 }.freeze
  enum status: STATUS

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :email, email: true, presence: true

  has_many :social_medium, through: :is_social_mediable
  has_many :diffusion, dependent: :destroy
end
