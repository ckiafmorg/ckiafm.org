# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :nom, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :emissions, through: :taggings, source: :taggable, source_type: Tagging::EMISSION
end
