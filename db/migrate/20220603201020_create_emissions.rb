# frozen_string_literal: true

class CreateEmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :emissions, id: :uuid do |t|
      t.string :nom, null: false, index: { unique: true }
      t.text :description, null: false
      t.boolean :speciale, null: false, default: false
      t.integer :status, null: false
      t.string :email, null: false
      t.string :slug, index: { unique: true }

      t.timestamps
    end
  end
end
