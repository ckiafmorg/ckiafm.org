# frozen_string_literal: true

class Membre < ApplicationRecord
  validates :prenom, presence: true
  validates :nom, presence: true
  validates :email, email: true, uniqueness: true, presence: true
  validates :phone, phone: true, presence: true
  validates :adresse, presence: true
  validates :code_postal, presence: true
  validates :ville, presence: true
  validates :province, presence: true
  validates :pays, presence: true

  has_many :paiements, dependent: :destroy
  belongs_to :membership

  def actif?
    paiements.last.date_fin_actif <= Time.zone.today
  end

  def fin_actif_membership
    paiements.last.date_fin_actif
  end
end
