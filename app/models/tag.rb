# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :nom, presence: true, uniqueness: true

  has_many :taggable, dependent: :nullify
  has_many :emissions, through: :taggable
end
