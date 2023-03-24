# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :subscription, null: false, foreign_key: true, type: :uuid
      t.string :stripe_id

      t.timestamps
    end
  end
end
