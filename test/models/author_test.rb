require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'An author has posts' do
    alice = Author.new
    assert_equal [], alice.posts
  end

  test 'create_remember_token returns a random token' do
    t1 = Author.create_remember_token
    assert_not_equal(t1, Author.create_remember_token)
  end
end
