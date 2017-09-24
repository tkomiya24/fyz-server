require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create user and return it as json' do
    user_params = {
      username: 'takeru',
      password: 'password',
      password_confirmation: 'password'
    }
    assert_difference('User.count', 1) do
      post(users_url, params: { user: user_params }, xhr: true)
    end

    actual = User.order(created_at: :desc).first
    assert_response :ok
    assert_equal(actual.username, 'takeru')
  end

  test 'should return create errors if user is invalid' do
    user_params = { field: 'value' }
    assert_no_difference('User.count') do
      post(users_url, params: { user: user_params }, xhr: true)
    end

    assert_response :bad_request
    assert_equal({ username: ['can\'t be blank'], password: ['can\'t be blank'] }.as_json,
                 JSON.parse(@response.body))
  end
end
