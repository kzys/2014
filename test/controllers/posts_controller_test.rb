require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
    @post.author = FactoryGirl.create(:author)
    @post.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { author_id: @post.author_id, content: @post.content, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_redirected_to posts_path
  end

  test "should update post" do
    patch :update, id: @post, post: { author_id: @post.author_id, content: @post.content, title: @post.title }
    assert_redirected_to posts_path
  end

  test "should destroy post" do
    assert_difference('Post.count', 0) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
