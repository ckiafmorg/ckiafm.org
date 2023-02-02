class CreateSocialMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :social_media, id: :uuid do |t|
      t.string :plateform
      t.string :url

      t.timestamps
    end
  end
end
