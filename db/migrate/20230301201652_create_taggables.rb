# frozen_string_literal: true

class CreateTaggables < ActiveRecord::Migration[7.0]
  def change
    create_table :taggables, id: :uuid do |t|
      t.references :emission, null: false, foreign_key: true, type: :uuid
      t.references :tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
