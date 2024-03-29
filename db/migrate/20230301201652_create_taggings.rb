# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings, id: :uuid do |t|
      t.references :taggable, null: false, type: :uuid, polymorphic: true
      t.references :tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
