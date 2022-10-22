# frozen_string_literal: true

require 'test_helper'

class EmissionTest < ActiveSupport::TestCase
  context 'validations' do
    subject { build :emission }

    should validate_presence_of :nom
    should validate_uniqueness_of :nom
    should validate_presence_of :description
    should validate_presence_of :status
    should validate_presence_of :email
  end
end
