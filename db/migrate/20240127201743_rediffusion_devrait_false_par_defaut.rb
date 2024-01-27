# frozen_string_literal: true

class RediffusionDevraitFalseParDefaut < ActiveRecord::Migration[7.1]
  def change
    change_column :diffusions, :rediffusion, :boolean, null: false, default: false
  end
end
