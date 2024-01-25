# frozen_string_literal: true

class EmissionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :emission
end
