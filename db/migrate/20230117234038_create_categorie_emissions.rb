# frozen_string_literal: true

class CreateCategorieEmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :categorie_emissions, id: :uuid do |t|
      t.string :nom
      t.string :couleur

      t.timestamps
    end
  end
end
