require 'spec_helper'

describe PostsController do
  subject { page }

  describe 'footer' do
    before { visit posts_path }
    it { should have_content 'Powered by Rails' }
  end

  describe 'list posts' do
    before {
      english_post = FactoryGirl.create(:english_post)
      japanese_post = FactoryGirl.create(:japanese_post)

      visit posts_path
    }
    it { should have_selector('article', :count => 2) }

    describe 'list English posts' do
      before {
        visit posts_path + '?language=en'
      }
      it { should have_selector('article', :count => 1) }
    end
  end

  describe 'Atom' do
    before {
      english_post = FactoryGirl.create(:english_post)
      japanese_post = FactoryGirl.create(:japanese_post)

      visit posts_recent_path + '.atom'
    }
    it { should have_selector('entry', :count => 2) }

    describe 'list English posts' do
      before {
        visit posts_recent_path + '.atom?language=en'
      }
      it { should have_selector('entry', :count => 1) }
      it { should have_selector('link[rel="self"]') }
    end
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
