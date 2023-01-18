# frozen_string_literal: true

class AddCategorieEmissionForeignKeyToEmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :emissions, :categorie_emission_id, :uuid
    add_foreign_key :emissions, :categorie_emissions
  end
end
