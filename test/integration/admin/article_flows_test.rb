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
end
