# frozen_string_literal: true

require 'test_helper'

class ProgrammationsControllerTest < ActionDispatch::IntegrationTest
  def test_programmation_is_displayed
    get programmation_path
    assert_response :success
  end
end
