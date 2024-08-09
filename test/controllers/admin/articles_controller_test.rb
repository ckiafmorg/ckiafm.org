# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def test_user_cannot_create_article
    sign_in(create(:user))

    get new_admin_article_url

    assert_response :forbidden
  end

  def test_admin_can_create_article
    sign_in(create(:user, :admin))

    get new_admin_article_url

    assert_response :success
  end

  def test_user_cannot_access_article_index
    sign_in(create(:user))

    get admin_articles_url

    assert_response :forbidden
  end

  def test_admin_can_access_article_index
    sign_in(create(:user, :admin))

    get admin_articles_url

    assert_response :success
  end

  def test_admin_creating_article
    sign_in(create(:user, :admin))
    tag = create(:tag)

    post admin_articles_url, params: { article: { titre: 'Some article', contenu: 'Some article content', status: :draft, published_at: '2024-01-01', tag_ids: [tag.id] } }

    assert_redirected_to admin_articles_url
  end

  def test_admin_editing_article
    sign_in(create(:user, :admin))
    article = create(:article)
    tag = create(:tag)

    put admin_article_url(article), params: { article: { titre: 'Some updated article', contenu: 'Some article content', status: :published, published_at: '2024-01-01', tag_ids: [tag.id] } }

    assert_redirected_to admin_articles_url
    assert article.status, :published
  end

  def test_admin_deleting_article
    sign_in(create(:user, :admin))
    article = create(:article)

    delete admin_article_url(article)

    assert_redirected_to admin_articles_url
  end

  def test_user_cannot_delete_article
    sign_in(create(:user))
    article = create(:article)

    delete admin_article_url(article)

    assert_response :forbidden
  end
end
