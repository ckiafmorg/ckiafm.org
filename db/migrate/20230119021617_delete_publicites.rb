# frozen_string_literal: true

class DeletePublicites < ActiveRecord::Migration[7.0]
  def change
    drop_table :format_publicites
  end
end
