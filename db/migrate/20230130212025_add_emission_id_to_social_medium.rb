class AddEmissionIdToSocialMedium < ActiveRecord::Migration[7.0]
  def change
    add_column :social_media, :emission_id, :uuid
  end
end
