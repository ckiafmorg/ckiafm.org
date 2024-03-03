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
end
