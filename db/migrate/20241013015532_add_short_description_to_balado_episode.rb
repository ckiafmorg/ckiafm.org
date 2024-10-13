# frozen_string_literal: true

class AddShortDescriptionToBaladoEpisode < ActiveRecord::Migration[7.2]
  def change
    add_column :balado_episodes, :short_description, :string, null: false, default: ''
  end
end
