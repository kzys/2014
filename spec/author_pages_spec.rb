require 'spec_helper'

describe 'Author pages' do
  describe 'show' do
    before do
      @author = FactoryGirl.create(:author)
      visit author_path(@author)
    end

    it 'should have the name of the author' do
      expect(page).to have_content(@author.name)
    end
  end
end
