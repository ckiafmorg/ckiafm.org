# frozen_string_literal: true

class RefactorDiffusions < ActiveRecord::Migration[7.0]
  def change
    # ActiveRecord supporte les colonne de type `Time`, on va donc utiliser ça
    # au lieu de gérer les heures et les minutes à la main.
    change_table :diffusions, bulk: true do |t|
      t.remove :debut_heure
      t.remove :debut_minute
      t.remove :fin_heure
      t.remove :fin_minute
    end

    # We can't set a default value here without the user logic
    change_table :diffusions, bulk: true do |t|
      t.time :temps_debut, null: false
      t.time :temps_fin, null: false
    end
  end
end
