# frozen_string_literal: true

describe 'admin authentication', type: :request do
  it 'redirects to the login page when you are not logged in' do
    get admin_path
    follow_redirect!

    expect(response).to redirect_to new_session_path
  end

  it 'redirects to the admin page when you are logged in' do
    user = create :user
    post session_path, params: { email: user.email, password: user.password }

    get new_session_path
    follow_redirect!

    expect(response).to redirect_to admin_dashboard_path
  end
end
