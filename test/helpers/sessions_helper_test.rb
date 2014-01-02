require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  include SessionsHelper

  test 'current_author should return nil by default' do
    assert_nil(self.current_author)
  end
end
