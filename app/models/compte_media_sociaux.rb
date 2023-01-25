# frozen_string_literal: true

class CompteMediaSociaux < ApplicationRecord
  validates plateforme, presence: true

  has_many :unit_ressource_locators, dependent: :destroy
  has_many :emissions, through: :unit_ressource_locators, polymorphic => true
end
