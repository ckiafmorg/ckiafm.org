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

  has_many :diffusions, dependent: :destroy

  has_many :taggable, dependent: :nullify
  has_many :tags, through: :taggable

  belongs_to :categorie_emission, dependent: :destroy

  has_many :emissions_users, dependent: :nullify
  has_many :users, through: :emissions_users

  has_many :social_media_accounts, as: :has_social_media_account, dependent: :destroy

  accepts_nested_attributes_for :social_media_accounts,
                                allow_destroy: true,
                                update_only: true,
                                reject_if: proc { |attributes| attributes[:platform].blank? || attributes[:url].blank? }
end
