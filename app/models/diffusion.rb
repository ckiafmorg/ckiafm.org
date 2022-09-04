# frozen_string_literal: true

class Diffusion < ApplicationRecord
  belongs_to :emission

  validates :debut_heure, presence: true, numericality: { min: 0, max: 23, only_integer: true }
  validates :debut_minute, presence: true, numericality: { min: 0, max: 59, only_integer: true }
  validates :fin_heure, presence: true, numericality: { min: 0, max: 23, only_integer: true }
  validates :fin_minute, presence: true, numericality: { min: 0, max: 59, only_integer: true }
  validate :valider_debut_fin

  private

  def valider_debut_fin
    # We need to check for blank since validation are chain and do not throw
    # error if presence validation failed earlier
    return if debut_heure.blank? or debut_minute.blank? or fin_heure.blank? or fin_minute.blank?

    if fin_heure < debut_heure
      errors.add(:fin_heure, I18n.t('activerecord.errors.models.diffusion.fin_heure.smaller_then_debut_heure'))
    end

    # rubocop:disable Style/GuardClause:
    if debut_heure == fin_heure and debut_minute > fin_minute
      errors.add(:fin_minute,
                 I18n.t('activerecord.errors.models.diffusion.fin_minute.smaller_then_debut_minute'))
    end
    # rubocop:enable Style/GuardClause:
  end
end
