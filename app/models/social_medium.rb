class SocialMedium < ApplicationRecord
  validates :plateform, presence: true
  validates :url, presence: true

  has_many :emissions, through: :is_social_mediable
end
