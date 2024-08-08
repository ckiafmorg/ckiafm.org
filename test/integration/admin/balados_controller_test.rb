# frozen_string_literal: true

require 'test_helper'

class BaladosControllerTest < ActionDispatch::IntegrationTest
  def test_user_cannot_create_balado
    sign_in(create(:user))

    get new_admin_balado_url

    assert_response :forbidden
  end

  def test_admin_can_create_balado
    sign_in(create(:user, :admin))

    get new_admin_balado_url

    assert_response :success
  end

  def test_admin_creating_balado
    sign_in(create(:user, :admin))
    user = create(:user)

    post admin_balados_url, params: { balado: { titre: 'A new balado', description: 'A new balado description', published_at: '2024-05-01', email: 'newbalado@ckiafm.org', website: 'https://newbalado.fm', status: :published, user_id: user.id } }

    assert_redirected_to admin_balados_url
  end

  def test_admin_editing_balado
    sign_in(create(:user, :admin))
    user = create(:user)
    balado = create(:balado, user_id: user.id)

    put admin_balado_url(balado), params: { balado: { titre: 'An updated title for the new podcast', description: 'An updated description of the new balado', published_at: '2024-05-01', email: 'newbalado@ckiafm.org', website: 'https://newbalado.fm', status: :published, user_id: user.id } }

    assert_redirected_to admin_balados_url
  end

  def test_admin_deleting_balado
    sign_in(create(:user, :admin))
    user = create(:user)
    balado = create(:balado, user_id: user.id)

    delete admin_balado_url(balado)

    assert_redirected_to admin_balados_url
  end

  def test_user_cannot_delete_balado
    sign_in(create(:user))
    user = create(:user)
    balado = create(:balado, user_id: user.id)

    delete admin_balado_url(balado)

    assert_response :forbidden
  end

  # FIXME: this should be a view test
  # def test_user_can_only_see_its_balados
  #   user = create(:user)
  #   balado1 = create(:balado)
  #   balado2 = create(:balado, user_id: user.id)
  #
  #   get admin_balados_url
  # end
end
