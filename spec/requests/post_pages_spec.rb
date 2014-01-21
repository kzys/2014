require 'spec_helper'

describe 'Post pages' do
  subject { page }

  describe 'footer' do
    before { visit posts_path }
    it { should have_content 'Powered by Rails' }
  end

  describe 'new (without a credential)' do
    before { visit new_post_path }
    it { should_not have_content 'New post' }
  end
end
