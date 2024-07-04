# frozen_string_literal: true

class Tagging < ApplicationRecord
  TAGGABLES = [
    EMISSION = 'Emission',
    ARTICLE = 'Article',
    BALADO = 'Balado'
  ].freeze

  belongs_to :tag
  belongs_to :taggable, polymorphic: true, touch: true

  validates :taggable_type, inclusion: { in: TAGGABLES }
end
