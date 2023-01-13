# frozen_string_literal: true

class CreateFormatPubs < ActiveRecord::Migration[7.0]
  def change
    create_table :format_publicites, id: :uuid do |t|
      t.string :nom, null: false, index: { unique: true }
      t.integer :longeur, null: false
      t.integer :largeur, null: false

      t.timestamps
    end
  end
end
