# frozen_string_literal: true

class EpisodeBalado < ApplicationRecord
  extend FriendlyId
  friendly_id :titre, use: :slugged

  STATUSES = %i[draft live].freeze
  enum :status, STATUSES

  validates :titre, presence: true
  validates :description, presence: true
  validates :published_at, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }

  belongs_to :balado
end
