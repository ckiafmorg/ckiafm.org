# frozen_string_literal: true

class SocialNetworkAccount < ApplicationRecord
  enum platforms = %i[facebook instagram twitter tiktok bluesky mastodon]

  belongs_to :has_social_media_account, polymorphic: true

  validates :url, presence: true
  validates :platform, presence: true, inclusion: { in: platforms.keys }
end
