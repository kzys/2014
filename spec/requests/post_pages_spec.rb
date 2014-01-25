require 'spec_helper'

describe PostsController do
  subject { page }

  describe 'footer' do
    before { visit posts_path }
    it { should have_content 'Powered by Rails' }
  end

  describe 'before logging in' do
    before { visit new_post_path }
    it { should_not have_content 'New post' }
  end

  describe 'after logging in' do
    author = FactoryGirl.create(:author)

    before {
      visit login_path
      fill_in 'Email', with: author.email
      fill_in 'Password', with: author.password
      click_button 'Login'
    }
    it { should have_content 'New post' }
    it { should have_content 'English' }

    describe 'creating a post' do
      before {
        fill_in 'Title', with: 'Hello'
        fill_in 'Content', with: 'hello world.'
      }

      it 'should create a post' do
        expect do
          click_button 'Create Post'
        end.to change(Post, :count).by(1)
      end
    end
  end
end
