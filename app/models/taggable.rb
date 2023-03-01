# frozen_string_literal: true

class Taggable < ApplicationRecord
  belongs_to :emission
  belongs_to :tag
end
