require 'spec_helper'

describe PostsController do
  subject { page }

  describe 'footer' do
    before { visit posts_path }
    it { should have_content 'Powered by Rails' }
  end

  describe 'creating a new post' do
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

        visit new_post_path
      }
      it { should have_content 'New post' }
      it { should have_content 'English' }
    end
  end
end
