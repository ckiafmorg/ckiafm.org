# frozen_string_literal: true

class EmissionEpisode < ApplicationRecord
  belongs_to :emission

  validates :published_at, presence: true
end
