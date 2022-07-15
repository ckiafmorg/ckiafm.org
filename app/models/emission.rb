# frozen_string_literal: true

class Emission < ApplicationRecord
  STATUS = { brouillon: 0, active: 1, vacance: 2, archive: 3 }.freeze
  enum status: STATUS

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  # TODO: add email: true when the `EmailValidator` will be created
  validates :email, presence: true
end
