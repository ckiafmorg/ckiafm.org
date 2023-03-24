# frozen_string_literal: true

class Membre < ApplicationRecord
  STATUS = %w[active unactive].freeze
  validates :stripe_id, presence: true
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :email, presence: true

  has_one :subscription

  before_validation :create_on_stripe, on: :create

  private

  def create_on_stripe
    params = { email: email, name: "#{prenom} #{nom}" }
    response = Stripe::Customer.create(params)
    self.stripe_id = response.id
  end

  def active?; end
end
