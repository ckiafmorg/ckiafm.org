# frozen_string_literal: true

class CreateMembreEquipes < ActiveRecord::Migration[7.1]
  def change
    create_table :membre_equipes, id: :uuid do |t|
      t.string :nom, null: false
      t.string :role, null: false
      t.references :emission, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
