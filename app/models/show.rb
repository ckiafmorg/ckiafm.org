# frozen_string_literal: true

class Show < ApplicationRecord
  SHOW_STATUSES = %w[draft active holiday archived].freeze
  enum status: SHOW_STATUSES

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: SHOW_STATUSES }
  # TODO: add email: true when the `EmailValidator` will be created
  validates :email, presence: true
end
