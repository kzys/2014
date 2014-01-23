require 'spec_helper'

describe Post do
  before { @post = Post.new }

  subject { @post }

  describe 'creating a post' do
    it { should_not be_valid }

    its(:language) { should eq('eng') }
    its(:author) { should eq(nil) }

    describe 'when the language is unknown' do
      before {
        @post.language = 'xxx'
      }
      it { should_not be_valid }
    end

    describe 'when the language is Japanese' do
      before {
        @post.language = 'jpn'
        @post.author = FactoryGirl.create(:author)
      }
      it { should be_valid }
    end
  end
end
