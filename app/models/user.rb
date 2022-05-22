# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  PASSWORD_MINIMAL_LENGTH = 24

  validates :email, presence: true, uniqueness: true, on: %i[create update]
  validates :password, presence: true, on: :create, length: { minimum: PASSWORD_MINIMAL_LENGTH }

  before_validation :strip_email_whitespace, on: %i[create update]

  def strip_email_whitespace
    self.email = email&.strip
  end
end
