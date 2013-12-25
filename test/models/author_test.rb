require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'An author has posts' do
    alice = Author.new
    assert_equal [], alice.posts
  end
end
