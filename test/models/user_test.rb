# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'validations' do
    subject { build :user }

    should have_secure_password
    should validate_presence_of :email
    should validate_uniqueness_of :email
    should validate_presence_of :password
  end

  test 'etant donne un email avec espaces quand quand #strip_email_whitespace alors retourn email sans espace' do
    user = build(:user, email: 'test@ckiafm.org    ')

    user.strip_email_whitespace

    assert_equal user.email, 'test@ckiafm.org'
  end

  test 'etant donne un email nil quand #strip_email_whitespace alors ne fait rien' do
    user = build(:user, email: nil)

    user.strip_email_whitespace

    assert_not user.valid?
  end
end
