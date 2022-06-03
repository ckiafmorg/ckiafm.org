# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Show, type: :model do
  describe 'validations' do
    subject(:show) { build :show }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :email }
  end
end
