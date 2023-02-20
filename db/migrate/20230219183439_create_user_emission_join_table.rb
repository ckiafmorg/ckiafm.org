# frozen_string_literal: true

class CreateUserEmissionJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :user, :emisisons, column_option: { type: :uuid }
  end
end
