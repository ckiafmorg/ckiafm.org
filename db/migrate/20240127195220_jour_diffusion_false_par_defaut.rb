# frozen_string_literal: true

class JourDiffusionFalseParDefaut < ActiveRecord::Migration[7.1]
  def change
    change_table :diffusions, bulk: true do |t|
      t.change :diffuse_lundi, :boolean, null: false, default: false
      t.change :diffuse_mardi, :boolean, null: false, default: false
      t.change :diffuse_mercredi, :boolean, null: false, default: false
      t.change :diffuse_jeudi, :boolean, null: false, default: false
      t.change :diffuse_vendredi, :boolean, null: false, default: false
      t.change :diffuse_samedi, :boolean, null: false, default: false
      t.change :diffuse_dimanche, :boolean, null: false, default: false
    end
  end
end
