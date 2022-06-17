# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Emission, type: :model do
  describe 'validations' do
    subject(:emission) { build :emission }

    it { is_expected.to validate_presence_of :nom }
    it { is_expected.to validate_uniqueness_of :nom }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :email }
  end
end
