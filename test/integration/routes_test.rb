require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'Show recent posts on /' do
    get '/'
    assert assigns(:posts)
  end
end
