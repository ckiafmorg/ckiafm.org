# frozen_string_literal: true

class AddTypeToDiffusion < ActiveRecord::Migration[7.0]
  def change
    add_column :diffusions, :type, :string
  end
end
