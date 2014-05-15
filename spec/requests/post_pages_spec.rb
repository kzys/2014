require 'spec_helper'

describe PostsController do
  subject { page }

  describe 'footer' do
    before { visit posts_path }
    it { should have_content 'Powered by Rails' }
  end

  describe 'No pagination' do
    before do
      20.times do
        FactoryGirl.create(:post)
      end
      visit posts_path
    end

    it { should have_selector('article', :count => 20) }
  end

  describe 'list posts' do
    before {
      english_post = FactoryGirl.create(:english_post)
      japanese_post = FactoryGirl.create(:japanese_post)

      visit posts_path
    }
    # it { should have_selector('article', :count => 2) }

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
    # it { should have_selector('entry', :count => 2) }

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
    before {
      author = FactoryGirl.create(:author)

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

    describe 'creating an invalid post' do
      before do
        fill_in 'Title', with: 'Hello'
      end

      it 'should create a post' do
        expect { click_button 'Create Post' }.to change(Post, :count).by 0
      end
    end

    describe 'updating a post' do
      before do
        english_post = FactoryGirl.create(:english_post)
        visit edit_post_path(english_post)
        fill_in 'Title', with: 'I will update the post'
        click_button 'Update Post'
      end

      it { should have_content 'I will update the post' }
    end

    describe 'updating an invalid post' do
      before do
        english_post = FactoryGirl.create(:english_post)
        visit edit_post_path(english_post)
        fill_in 'Title', with: ''
        click_button 'Update Post'
      end

      it { should_not have_content 'I will update the post' }
    end

    describe 'deleting a post' do
      before do
        fill_in 'Title', with: 'Hello'
        fill_in 'Content', with: 'hello world.'
        click_button 'Create Post'
      end

      it 'should delete a post' do
        expect {  click_link 'Destroy' }.to change(Post, :count).by -1
      end
    end

    describe 'accesing a post with an invalid link' do
      it 'should throw an exception' do
        post = FactoryGirl.create(:english_post)
        date = post.created_at.yesterday
        permalink = "/posts/#{date.month}/#{date.day}/#{post.id}"

        expect { visit permalink }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
