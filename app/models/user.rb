# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %w[producer admin].freeze

  has_secure_password

  PASSWORD_MINIMAL_LENGTH = 24

  validates :email, email: true, presence: true, uniqueness: true, on: %i[create update]
  validates :password, presence: true, on: :create, length: { minimum: PASSWORD_MINIMAL_LENGTH }
  validates :role, presence: true

  before_validation :strip_email_whitespace, on: %i[create update]

  has_many :emissions, through: :emisisons_user

  def strip_email_whitespace
    self.email = email&.strip
  end

  def signed_in?
    true
  end

  def admin?
    role == 'admin'
  end
end
