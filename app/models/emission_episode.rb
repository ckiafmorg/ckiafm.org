# frozen_string_literal: true

class EmissionEpisode < ApplicationRecord
  belongs_to :emission

  has_many :entrees, dependent: :destroy, class_name: 'EntreeFeuilleRoute'

  accepts_nested_attributes_for :entrees,
                                allow_destroy: true,
                                reject_if: proc { |attrs|
                                  attrs[:titre_piece].blank? || attrs[:temps_debut].blank? || attrs[:temps_fin].blank?
                                }
  validates :published_at, presence: true
end
