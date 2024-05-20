# frozen_string_literal: true

class DiffusionsTimeToString < ActiveRecord::Migration[7.1]
  def change
    change_table :diffusions, bulk: true do |t|
      t.remove :temps_debut, type: :time
      t.remove :temps_fin, type: :time
    end

    change_table :diffusions, bulk: true do |t|
      t.string :temps_debut, null: false, default: ''
      t.string :temps_fin, null: false, default: ''
    end
  end
end
