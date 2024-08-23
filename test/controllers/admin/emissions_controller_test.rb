# frozen_string_literal: true

class EmissionsControllerTest < ActionDispatch::IntegrationTest
  def test_user_cannot_create_emission
    sign_in(create(:user))

    get new_admin_emission_url

    assert_response :forbidden
  end

  def test_admin_can_create_emission
    sign_in(create(:user, :admin))

    get new_admin_emission_url

    assert_response :success
  end

  def test_user_can_see_its_emissions
    user = create(:user)
    emission = create(:emission)
    create(:emissions_user, user_id: user.id, emission_id: emission.id)

    sign_in(user)

    get admin_emission_url(emission)

    assert_response :success
  end

  def test_user_can_edit_its_emissions
    user = create(:user)
    emission = create(:emission)
    create(:emissions_user, user_id: user.id, emission_id: emission.id)

    sign_in(user)

    get edit_admin_emission_url(emission)

    assert_response :success
  end

  def test_admin_creating_emission
    sign_in(create(:user, :admin))
    user = create(:user)
    tag = create(:tag)
    category = create(:categorie_emission)

    post admin_emissions_url, params: {
      emission: {
        # nom: 'An emission name',
        description: 'An emission description',
        email: 'emission@ckiafm.org',
        status: :live,
        category_emission_id: category.id,
        user_ids: [user.id],
        tag_ids: [tag.id],
        social_media_accounts_attributes: [],
        membre_equipes_attributes: []
      }
    }

    # FIXME: make this test work and try to understand why it redirects to `admin_emissions_url` instead of going to `admin_emission_url(latest_emission)`
    # assert_equal I18n.t('admin.emissions.successfully_created'), flash[:notice]
  end
end
