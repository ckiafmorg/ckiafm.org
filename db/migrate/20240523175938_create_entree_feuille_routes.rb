# frozen_string_literal: true

class CreateEntreeFeuilleRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :entree_feuille_routes, id: :uuid do |t|
      t.integer :vocal, null: false, default: 0
      t.integer :origine, null: false, default: 0
      t.integer :source, null: false, default: 0
      t.string :titre_piece, null: false, default: ''
      t.string :temps_debut, null: false, default: ''
      t.string :temps_fin, null: false, default: ''
      t.references :emission_episode, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
