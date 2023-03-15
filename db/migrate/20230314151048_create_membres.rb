# frozen_string_literal: true

class CreateMembres < ActiveRecord::Migration[7.0]
  def change
    create_table :membres, id: :uuid do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.boolean :payed

      t.timestamps
    end
  end
end
