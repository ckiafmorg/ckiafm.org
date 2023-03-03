# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def test_get_new
    get new_admin_user_path
    assert_response :found
  end

  def test_get_index
    get admin_users_path
    assert_response :found
  end
end
