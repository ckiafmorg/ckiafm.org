# frozen_string_literal: true

class CreateBalados < ActiveRecord::Migration[7.1]
  def change
    create_table :balados, id: :uuid do |t|
      t.string :titre, null: false, index: { unique: true }
      t.text :description, null: false
      t.datetime :published_at, null: false
      t.string :email, null: false, default: ''
      t.string :website, null: false, default: ''
      t.string :slug
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
