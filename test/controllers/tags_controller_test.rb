# frozen_string_literal: true

require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in(create(:user)) }

  def test_get_new
    get new_admin_tag_url
    assert_response :success
  end

  # TODO: test creating a new Tag

  def test_get_index
    get admin_tags_url
    assert_response :success
  end
end
