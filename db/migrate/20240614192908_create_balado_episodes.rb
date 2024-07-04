# frozen_string_literal: true

class CreateBaladoEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :balado_episodes, id: :uuid do |t|
      t.string :titre, null: false
      t.string :slug
      t.text :description, null: false
      t.text :transcript
      t.datetime :published_at, null: false
      t.integer :status, null: false, default: 0
      t.string :audio_url
      t.references :balado, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
