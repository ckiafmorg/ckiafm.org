# frozen_string_literal: true

class ChangeEmissionStatusFromIntegerToString < ActiveRecord::Migration[7.1]
  def change
    change_column :emissions, :status, :string, null: false, default: :brouillon
  end
end
