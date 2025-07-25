# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId

  friendly_id :titre, use: :slugged

  has_many :taggings, dependent: :destroy, as: :taggable
  has_many :tags, through: :taggings

  STATUSES = { draft: 0, published: 10 }.freeze
  enum :status, STATUSES

  validates :titre, presence: true
  validates :contenu, presence: true
  validates :published_at, presence: true
  validates :status, presence: true

  default_scope { order(:published_at) }

  def self.live
    where(published_at: ...Time.zone.now)
  end
end
