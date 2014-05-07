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
    end

    it 'should create an author' do
      fill_in 'Password', with: 'passw0rd'
      fill_in 'Password confirmation', with: 'passw0rd'

      expect { click_button 'Create Author' }.to change(Author, :count).by 1
    end

    it 'should not create an invalid author' do
      fill_in 'Password', with: 'passw0rd'
      fill_in 'Password confirmation', with: 'password'

      expect { click_button 'Create Author' }.to change(Author, :count).by 0
    end
  end

  describe 'delete' do
    before do
      @author_to_delete = FactoryGirl.create(:author)
    end

    subject do
      visit author_path(@author_to_delete)
      click_link 'Destroy'
      Author.find_by(id: @author_to_delete.id)
    end

    context 'when logged in' do
      before do
        login FactoryGirl.create(:author)
      end

      it { should be_true }
    end

    context 'when logged in as an administrator' do
      before do
        login FactoryGirl.create(:admin)
      end

      it { should_not be_true }
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
