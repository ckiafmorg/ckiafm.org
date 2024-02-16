# frozen_string_literal: true

class CreateSocialMediaAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :social_media_accounts, id: :uuid do |t|
      t.string :url, null: false
      t.integer :platform, null: false
      t.string :nom
      t.references :has_social_media_account, type: :string, polymorphic: true, null: false

      t.timestamps
    end
  end
end
