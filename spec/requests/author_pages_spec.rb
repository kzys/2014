require 'spec_helper'

def login(author)
  visit login_path
  fill_in 'Email', with: author.email
  fill_in 'Password', with: author.password
  click_button 'Login'
end

describe 'Author pages' do
  subject do
    page
  end

  describe 'new' do
    before do
      login FactoryGirl.create(:admin)
      visit new_author_path
      fill_in 'Email', with: "bob@example.com"
      fill_in 'Name', with: 'Bob'
      fill_in 'Password', with: 'passw0rd'
      fill_in 'Password confirmation', with: 'passw0rd'
    end

    it 'should create an author' do
      expect { click_button 'Create Author' }.to change(Author, :count).by 1
    end
  end

  describe 'show' do
    before do
      @author = FactoryGirl.create(:author)
      visit author_path(@author)
    end

    it { should have_content(@author.name) }
  end

  describe 'index' do
    before do
      Author.delete_all
      5.times do
        FactoryGirl.create(:author)
      end
      visit authors_path
    end

    it { should have_selector('tbody tr', :count => 5) }
  end
end
