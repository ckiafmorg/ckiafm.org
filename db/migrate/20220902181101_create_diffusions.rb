# frozen_string_literal: true

class CreateDiffusions < ActiveRecord::Migration[7.0]
  def change
    create_table :diffusions, id: :uuid do |t|
      t.integer :debut_heure, null: false
      t.integer :debut_minute, null: false
      t.integer :fin_heure, null: false
      t.integer :fin_minute, null: false
      t.boolean :diffuse_lundi
      t.boolean :diffuse_mardi
      t.boolean :diffuse_mercredi
      t.boolean :diffuse_jeudi
      t.boolean :diffuse_vendredi
      t.boolean :diffuse_samedi
      t.boolean :diffuse_dimanche
      t.boolean :redifussion, null: false, default: false
      t.references :emission, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
