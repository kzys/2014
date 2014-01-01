require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'An author has posts' do
    author = FactoryGirl.create(:author)
    assert_equal false, author.admin?
    assert_equal [], author.posts
  end

  test 'create_remember_token returns a random token' do
    t1 = Author.create_remember_token
    assert_not_equal(t1, Author.create_remember_token)
  end
end
