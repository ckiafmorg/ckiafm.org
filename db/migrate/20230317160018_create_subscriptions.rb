class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.string :nom
      t.integer :prix_cents
      t.integer :moyen_payment
      t.references :membres, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
