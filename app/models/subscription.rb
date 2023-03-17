class Subscription < ApplicationRecord

  attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv


  validates :nom, presence: true


  belongs_to :membres
  has_one :payment
end
