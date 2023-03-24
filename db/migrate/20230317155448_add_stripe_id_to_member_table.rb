# frozen_string_literal: true

class AddStripeIdToMemberTable < ActiveRecord::Migration[7.0]
  def change
    add_column :membres, :stripe_id, :string
  end
end
