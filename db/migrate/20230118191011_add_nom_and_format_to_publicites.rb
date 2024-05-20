# frozen_string_literal: true

class AddNomAndFormatToPublicites < ActiveRecord::Migration[7.0]
  def change
    change_table :publicites, bulk: true do |t|
      t.string :nom, null: false, index: { unique: true }, default: ''
      t.string :format_id, null: false, default: ''
    end
  end
end
