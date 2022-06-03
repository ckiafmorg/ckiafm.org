# frozen_string_literal: true

class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :description, null: false
      t.boolean :special, null: false, default: false
      t.integer :status, null: false
      t.string :email, null: false
      t.string :slug

      t.timestamps
    end
  end
end
