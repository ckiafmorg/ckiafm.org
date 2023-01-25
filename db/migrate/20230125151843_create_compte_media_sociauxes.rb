# frozen_string_literal: true

class CreateCompteMediaSociauxes < ActiveRecord::Migration[7.0]
  def change
    create_table :compte_media_sociauxes, id: :uuid do |t|
      t.string :plateforme

      t.timestamps
    end
  end
end
