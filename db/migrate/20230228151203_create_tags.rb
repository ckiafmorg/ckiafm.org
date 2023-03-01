# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :nom, index: { unique: true }

      t.timestamps
    end
  end
end
