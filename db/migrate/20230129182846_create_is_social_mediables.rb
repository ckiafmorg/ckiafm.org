class CreateIsSocialMediables < ActiveRecord::Migration[7.0]
  def change
    create_table :is_social_mediables, id: :uuid do |t|
      t.string :emissionId
      t.string :socialMediaId

      t.timestamps
    end
  end
end
