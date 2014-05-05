require 'spec_helper'

describe SessionsController do
  describe 'login with a valid credential' do
    author = FactoryGirl.create(:author)

    before do
      visit login_path
      fill_in 'Email', with: author.email
      fill_in 'Password', with: author.password
      click_button 'Login'
    end
    it { expect(page).to have_content 'New post' }

    describe 'logout' do
      before do
        visit logout_path
      end

      it { expect(current_url).to match login_path }
    end
  end

  describe 'login with an invalid credential' do
    author = FactoryGirl.create(:author)

    before do
      visit login_path
      fill_in 'Email', with: author.email
      fill_in 'Password', with: 'invalid_password'
      click_button 'Login'
    end

    it { expect(current_url).to match sessions_path }
  end
end
