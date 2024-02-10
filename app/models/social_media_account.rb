# frozen_string_literal: true

class SocialMediaAccount < ApplicationRecord
  PLATFORMS = %i[facebook instagram twitter tiktok mastodon].freeze
  enum :platform, PLATFORMS

  belongs_to :has_social_media_account, polymorphic: true

  validates :url, presence: true
  validates :platform, presence: true, inclusion: { in: platforms.keys }
end
