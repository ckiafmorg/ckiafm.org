# frozen_string_literal: true

class AddDateDebutDiffusions < ActiveRecord::Migration[7.0]
  def change
    # We can't set the date debut without the user input
    # rubocop:disable Rails/NotNullColumn
    add_column :diffusions, :date_debut, :date, null: false
    # rubocop:enable Rails/NotNullColumn
  end
end
