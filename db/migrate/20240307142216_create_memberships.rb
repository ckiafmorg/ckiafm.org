# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.string :nom, null: false, index: { unique: true }
      t.decimal :montant, precision: 8, scale: 2, null: false
      t.integer :reccurence, null: false

      t.timestamps
    end
  end
end
