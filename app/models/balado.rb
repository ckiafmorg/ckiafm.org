# frozen_string_literal: true

class Balado < ApplicationRecord
  extend FriendlyId
  friendly_id :titre, use: :slugged

  STATUSES = %i[draft published].freeze
  enum :status, STATUSES

  validates :titre, presence: true, uniqueness: true
  validates :description, presence: true
  validates :published_at, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :email, email: true, presence: true

  has_many :episodes, dependent: :destroy, class_name: 'BaladoEpisode'

  has_many :taggings, dependent: :destroy, as: :taggable
  has_many :tags, through: :taggings

  belongs_to :user
end
