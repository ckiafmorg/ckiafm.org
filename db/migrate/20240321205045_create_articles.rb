# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :titre, null: false
      t.string :slug
      t.text :contenu, null: false
      t.date :published_at, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
