# frozen_string_literal: true

require 'test_helper'

class AuthRedirectionTest < ActionDispatch::IntegrationTest
  test 'redirige vers la page de connexion quand on veut acceder une page protegee sans etre connecte' do
    get admin_path
    follow_redirect!

    assert_redirected_to new_session_path
  end

  test 'redirige vers la page admin quand on y accede en etant connecte' do
    user = create(:user)

    post session_path, params: { email: user.email, password: user.password }
    follow_redirect!

    assert_redirected_to admin_dashboard_path
  end
end
