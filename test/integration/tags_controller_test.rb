# frozen_string_literal: true

require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  # TODO: test creating a new Tag

  def test_non_admin_user_can_not_get_new_tag_form
    sign_in(create(:user))
    get new_admin_tag_url
    assert_response :forbidden
  end

  def test_admin_user_can_get_new_tag_form
    sign_in(create(:user, :admin))
    get new_admin_tag_url
    assert_response :success
  end

  def test_non_admin_user_can_not_get_tags_index
    sign_in(create(:user))
    get admin_tags_url
    assert_response :forbidden
  end

  def test_admin_user_can_get_tags_index
    sign_in(create(:user, :admin))
    get admin_tags_url
    assert_response :success
  end
end
