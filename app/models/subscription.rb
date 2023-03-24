# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :nom, presence: true

  attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv

  belongs_to :membre
  has_one :payment

  after_create :create_payment
  enum payment_method: { :credit_card => 0 }

  private

  def create_payment
    params = {
      order_id: id,
      credit_card_number: credit_card_number,
      credit_card_exp_month: credit_card_exp_month,
      credit_card_exp_year: credit_card_exp_year,
      credit_card_cvv: credit_card_cvv
    }
    Payment.create!(params)
  end
end
