# frozen_string_literal: true

class Emission < ApplicationRecord
  extend FriendlyId
  friendly_id :nom, use: :slugged

  STATUSES = %i[brouillon active vacance archive].freeze
  enum :status, STATUSES

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :email, email: true, presence: true

  belongs_to :categorie_emission, dependent: :destroy

  has_many :diffusions, dependent: :destroy
  has_many :episodes, dependent: :destroy, class_name: 'EmissionEpisode'

  has_many :taggings, dependent: :destroy, as: :taggable
  has_many :tags, through: :taggings

  has_many :emissions_users, dependent: :nullify
  has_many :users, through: :emissions_users

  has_many :membre_equipes, dependent: :destroy
  accepts_nested_attributes_for :membre_equipes,
                                allow_destroy: true,
                                reject_if: proc { |attrs| attrs[:nom].blank? || attrs[:role].blank? }

  has_many :social_media_accounts, as: :has_social_media_account, dependent: :destroy
  accepts_nested_attributes_for :social_media_accounts,
                                allow_destroy: true,
                                reject_if: proc { |attrs| attrs[:platform].blank? || attrs[:url].blank? }

  def prochaine_diffusion; end
end
