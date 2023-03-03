# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'anonymous users a never signed in' do
    user = AnonymousUser.new

    signed_in = user.signed_in?

    assert_not signed_in
  end

  test 'anonymous users are never admin' do
    user = AnonymousUser.new

    admin = user.admin?

    assert_not admin
  end
end
