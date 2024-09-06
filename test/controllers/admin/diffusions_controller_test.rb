# frozen_string_literal: true

class DiffusionsControllerTest < ActionDispatch::IntegrationTest
  def test_admin_can_create_diffusion
    emission = create(:emission)
    sign_in(create(:user, :admin))

    get new_admin_emission_diffusion_url(emission)

    assert_response :success
  end

  def test_admin_can_edit_diffusion
    emission = create(:emission)
    diffusion = create(:diffusion, emission: emission)
    sign_in(create(:user, :admin))

    get edit_admin_emission_diffusion_url(emission, diffusion)

    assert_response :success
  end

  def test_user_cannot_create_diffusion
    emission = create(:emission)
    sign_in(create(:user))

    get new_admin_emission_diffusion_url(emission)

    assert_response :forbidden
  end

  def test_user_cannot_edit_diffusion
    emission = create(:emission)
    diffusion = create(:diffusion, emission: emission)
    sign_in(create(:user))

    get edit_admin_emission_diffusion_url(emission, diffusion)

    assert_response :forbidden
  end
end
