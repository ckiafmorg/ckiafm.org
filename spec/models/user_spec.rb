# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject(:user) { build :user }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#strip_email_whitespace' do
    it 'strip spaces in email' do
      user = build(:user, email: 'test@ckiafm.org    ')
      user.strip_email_whitespace
      expect(user.email).to eq 'test@ckiafm.org'
    end

    it 'does not try to stip on nil value' do
      user = build(:user, email: nil)
      user.strip_email_whitespace
      expect(user.valid?).to be false
    end
  end
end
