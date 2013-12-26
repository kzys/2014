require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'Login with an invalid author' do
    post :create, { :session => { :email => 'alice@example.com' } }
    assert_not_nil flash[:danger]

    Author.new(email: 'alice@example.com')
  end

  test 'Login with a valid author' do
    alice = Author.new(email: 'alice@example.com')
    alice.save

    post :create, { :session => { :email => alice.email } }
  end
end
