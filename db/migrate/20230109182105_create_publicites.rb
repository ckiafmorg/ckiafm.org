# frozen_string_literal: true

class CreatePublicites < ActiveRecord::Migration[7.0]
  def change
    create_table :publicites, id: :uuid do |t|
      t.string :liens, null: false
      t.date :date_debut, null: false
      t.date :date_fin, null: false

      t.timestamps
    end
  end
end
