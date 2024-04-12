# frozen_string_literal: true

class CreateEmissionEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :emission_episodes, id: :uuid do |t|
      t.string :titre
      t.datetime :published_at, null: false
      t.text :description
      t.references :emission, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
