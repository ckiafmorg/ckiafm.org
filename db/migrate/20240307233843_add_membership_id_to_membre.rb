# frozen_string_literal: true

class AddMembershipIdToMembre < ActiveRecord::Migration[7.1]
  def change
    add_column :membres, :membership_id, :uuid
    add_foreign_key :membres, :memberships, column: :membership_id, index: true
  end
end
