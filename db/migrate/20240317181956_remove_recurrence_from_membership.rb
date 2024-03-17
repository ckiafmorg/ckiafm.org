# frozen_string_literal: true

class RemoveRecurrenceFromMembership < ActiveRecord::Migration[7.1]
  def change
    remove_column :memberships, :reccurence
  end
end
