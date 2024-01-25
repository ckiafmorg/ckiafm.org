# frozen_string_literal: true

class Emission < ApplicationRecord
  extend FriendlyId
  friendly_id :nom, use: :slugged

  STATUS = { brouillon: 0, active: 1, vacance: 2, archive: 3 }.freeze
  enum status: STATUS

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :email, email: true, presence: true

  has_many :diffusions, dependent: :destroy

  has_many :taggable, dependent: :nullify
  has_many :tags, through: :taggable

  belongs_to :categorie_emission, dependent: :destroy

  has_many :emissions_users, dependent: :nullify
  has_many :users, through: :emissions_users
end
