# frozen_string_literal: true

require 'test_helper'

class CompteMediaSociauxControllerTest < ActionDispatch::IntegrationTest
  def test_get_index
    get compte_media_sociaux_index_url
    assert_response :success
  end
end
