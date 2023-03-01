# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in(create(:user)) }

  def test_get_new
    get new_admin_user_path
    assert_response :success
  end

  # TODO: test creating a new user

  def test_get_index
    get admin_users_path
    assert_response :success
  end
end
