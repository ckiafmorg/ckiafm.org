# frozen_string_literal: true

class CreateSocialNetworkAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :social_network_accounts, id: :uuid do |t|
      t.string :url, null: false
      t.string :platform, null: false
      t.references :has_social_media_account, polymorphic: true, null: false

      t.timestamps
    end
  end
end
