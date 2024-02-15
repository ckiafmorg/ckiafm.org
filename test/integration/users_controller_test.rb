# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # TODO: user creation test

  def test_non_admin_user_can_not_get_new_user_form
    sign_in(create(:user))
    get new_admin_user_path
    assert_response :forbidden
  end

  def test_admin_user_can_get_new_user_form
    sign_in(create(:user, :admin))
    get new_admin_user_path
    assert_response :success
  end

  def test_non_admin_user_can_not_get_users_index
    sign_in(create(:user))
    get admin_users_path
    assert_response :forbidden
  end

  def test_admin_user_can_get_users_index
    sign_in(create(:user, :admin))
    get admin_users_path
    assert_response :success
  end
end
