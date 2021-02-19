module Support
  module IntegrationHelpers
    # Integration tests
    def sign_in(user = create(:user))
      post '/users/sign_in', params: {
        user: {
          email: user.email,
          password: 'somepassword'
        }
      }
      assert_response :redirect
      follow_redirect!
    end

    def sign_out
      delete '/users/sign_out'
    end

    def requires_authentication
      raise ArgumentError, 'Block missing. Example: requires_authentication { get edit_object_path(object) }' unless block_given?

      yield

      assert_redirected_to '/users/sign_in'
      assert_not flash[:alert].nil?
    end

    def requires_authorization
      raise ArgumentError, 'Block missing. Example: requires_authorization { get edit_object_path(object) }' unless block_given?

      yield

      assert_redirected_to root_path
      assert_not flash[:alert].nil?
    end
  end
end