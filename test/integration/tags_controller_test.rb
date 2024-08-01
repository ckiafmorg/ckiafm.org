# frozen_string_literal: true

require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  def test_user_cannot_create_tag
    sign_in(create(:user))

    get new_admin_tag_url

    assert_response :forbidden
  end

  def test_admin_can_create_tag
    sign_in(create(:user, :admin))

    get new_admin_tag_url

    assert_response :success
  end

  def test_user_cannot_access_tags_index
    sign_in(create(:user))

    get admin_tags_url

    assert_response :forbidden
  end

  def test_admin_can_access_tags_index
    sign_in(create(:user, :admin))

    get admin_tags_url

    assert_response :success
  end

  def test_admin_creating_tag
    sign_in(create(:user, :admin))

    post admin_tags_url, params: { tag: { nom: 'gentrification' } }

    assert_redirected_to admin_tags_url
  end
end
