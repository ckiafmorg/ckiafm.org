# frozen_string_literal: true

require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  def test_memberships_index_works
    sign_in(create(:user, :admin))
    get admin_memberships_url
    assert_response :success
  end
end
