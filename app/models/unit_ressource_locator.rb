# frozen_string_literal: true

class UnitRessourceLocator < ApplicationRecord
  validates String_url, presence: true

  belongs_to :emission
  belongs_to :compte_media_sociaux
end
