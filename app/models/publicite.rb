# frozen_string_literal: true

class Publicite < ApplicationRecord
  validates :nom, presence: true, uniqueness: true
  validates :liens, presence: true, url: true
  validates :format_id, presence: true
  validates :date_debut, presence: true
  validates :date_fin, presence: true
  validate :date_est_valide
  has_one_attached :image

  def format
    FormatPublicite.for(format_id)
  end

  private

  def date_est_valide
    return if date_debut < date_fin

    errors.add(:date_fin, I18n.t('admin.pub.validation.date_fin_invalide'))
  end
end
