# frozen_string_literal: true

class SubscriptionController < ApplicationController
  # protect_from_forgery with: :null_session
  def new
    @sub = Subscription.new
  end

  def create
    @sub = Subscription.new(subscription_params.merge(prix_cents: rand(1000...10_000), payment_method: 'credit_card'))

    if @sub.save
      render json: { subscription: @sub, payment: @sub.payment }, status: :created
    else
      render json: @sub.errors, status: :unprocessable_entity

    end
  end

  private

  def subscription_params
    params.require(:data).permit(:membres_id, :credit_card_number, :credit_card_exp_month, :credit_card_exp_year,
                                 :credit_card_cvv)
  end
end
