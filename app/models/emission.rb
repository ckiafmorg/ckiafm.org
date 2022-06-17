# frozen_string_literal: true

class Emission < ApplicationRecord
  SHOW_STATUSES = %w[brouillon active vacance archive].freeze
  enum status: SHOW_STATUSES

  validates :nom, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: SHOW_STATUSES }
  # TODO: add email: true when the `EmailValidator` will be created
  validates :email, presence: true
end
