# frozen_string_literal: true

class EmissionEpisodesControllerTest < ActionDispatch::IntegrationTest
  # TODO: check if user can edit emission_episode they don't own
  # TODO: check if user can edit balado they don't own
  # TODO: check if user can edit balado_episode they don't own
  def admin_can_create_emission_episode
    sign_in(create(:user, :admin))

    get new_admin_emission_episode_url

    assert_response :success
  end
end
