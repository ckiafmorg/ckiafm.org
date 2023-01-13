# frozen_string_literal: true

class AddNomAndFormatToPublicites < ActiveRecord::Migration[7.0]
  def change
    change_table :publicites, bulk: true do |t|
      t.string :nom, null: false, index: { unique: true }
      t.string :format_id, null: false
    end
  end
end
