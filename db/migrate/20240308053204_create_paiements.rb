# frozen_string_literal: true

class CreatePaiements < ActiveRecord::Migration[7.1]
  def change
    create_table :paiements, id: :uuid do |t|
      t.references :membre, null: false, foreign_key: true, type: :uuid
      t.decimal :montant, precision: 8, scale: 2, null: false
      t.date :date_fin_actif, null: false

      t.timestamps
    end
  end
end
