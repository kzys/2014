require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'Login without password' do
    post :create, { :session => { :email => 'alice@example.com' } }
    assert_not_nil flash[:danger]
  end

  test 'Login with a valid author' do
    author = FactoryGirl.create(:author)
    post :create, {
      :session => { :email => author.email, :password => author.password }
    }
    assert flash.now[:success], 'success'
  end
end
