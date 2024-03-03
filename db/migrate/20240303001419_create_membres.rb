# frozen_string_literal: true

class CreateMembres < ActiveRecord::Migration[7.1]
  def change
    create_table :membres, id: :uuid do |t|
      t.string :prenom, null: false
      t.string :nom, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :phone, null: false
      t.string :adresse, null: false
      t.string :code_postal, null: false
      t.string :ville, null: false
      t.string :province, null: false
      t.string :pays, null: false

      t.timestamps
    end
  end
end
