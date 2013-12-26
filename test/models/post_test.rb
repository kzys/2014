require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'A post has an author' do
    post = Post.new
    assert_equal nil, post.author

    alice = Author.new
    alice.password = alice.password_confirmation = 'passw0rd'
    assert alice.save

    post.author_id = alice.id
    assert_equal alice, post.author

    post.save
    assert_equal [post], alice.posts
  end
end
