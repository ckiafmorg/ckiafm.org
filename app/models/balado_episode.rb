# frozen_string_literal: true

class BaladoEpisode < ApplicationRecord
  extend FriendlyId
  friendly_id :titre, use: :slugged

  # TODO: add some validation on the file, but also make sure we have either an url or a file
  has_one_attached :audio_file

  STATUSES = %i[draft published].freeze
  enum :status, STATUSES

  validates :titre, presence: true
  validates :description, presence: true
  validates :short_description, presence: true
  validates :published_at, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }

  belongs_to :balado, dependent: :destroy

  def self.live
    where(published_at: ...Time.zone.now)
  end

  def audio_src
    if audio_url.empty?
      audio_file.url
    else
      audio_url
    end
  end
end
