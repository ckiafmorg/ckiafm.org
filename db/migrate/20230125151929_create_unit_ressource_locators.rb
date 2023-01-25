# frozen_string_literal: true

class CreateUnitRessourceLocators < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_ressource_locators, id: :uuid do |t|
      t.string :String_url

      t.timestamps
    end
  end
end
