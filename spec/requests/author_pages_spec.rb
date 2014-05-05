require 'spec_helper'

describe 'Author pages' do
  subject do
    page
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
