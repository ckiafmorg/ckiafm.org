# frozen_string_literal: true

class FixDiffusionColumnNameTypo < ActiveRecord::Migration[7.0]
  def change
    rename_column :diffusions, :redifussion, :rediffusion
  end
end
