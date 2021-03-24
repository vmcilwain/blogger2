require 'test_helper'

class Admin::ArticleFlowsTest < ActionDispatch::IntegrationTest
  test 'requires authentication' do
    article = create :article

    requires_authentication { get admin_articles_path }
    requires_authentication { get admin_article_path(article) }
  end

  test 'as an administrator, I can view a list of articles' do
    sign_in admin_user

    get '/admin/articles'
    assert_response :success
  end
  
  test 'as an administrator, I can view a an article' do
    article = create :article

    sign_in admin_user

    get "/admin/articles/#{article.id}"
    assert_response :success
  end

  test 'as an administrator, I can create an article' do
    sign_in admin_user

    get '/admin/articles/new'
    assert_response :success

    post '/admin/articles', params: { article: attributes_for(:article) }

    assert_response :redirect
    assert_redirected_to admin_article_path(Article.last)
    follow_redirect!
    assert_response :success
    assert flash[:success].present?
  end

  test 'as an administrator, I am presented with errors when creating a post fails' do
    sign_in admin_user

    post '/admin/articles', params: { article: attributes_for(:article, content: nil) }
    assert_response :ok
    assert flash[:error].present?
  end
end
