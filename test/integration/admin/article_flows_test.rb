require "test_helper"

class Admin::ArticleFlowsTest < ActionDispatch::IntegrationTest
  test 'requires authentication' do
    requires_authentication { get admin_articles_path }
  end

  test 'as an administrator, I can view a list of articles' do
    sign_in admin_user

    get '/admin/articles'
    assert_response :success
  end
end
