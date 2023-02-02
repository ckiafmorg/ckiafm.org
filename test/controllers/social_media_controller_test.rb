require "test_helper"

class SocialMediaControllerTest < ActionDispatch::IntegrationTest
  def test_get_index
    get social_media_index_url
    assert_response :success
  end

  def test_get_new
    get social_media_new_url
    assert_response :success
  end

end
