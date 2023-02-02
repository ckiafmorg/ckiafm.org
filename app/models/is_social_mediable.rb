class IsSocialMediable < ApplicationRecord

  belongs_to :social_medium, dependent: :destroy
  belongs_to :social_mediable, polymorphic: true, dependent: :destroy
end
