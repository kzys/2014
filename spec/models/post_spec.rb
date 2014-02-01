require 'spec_helper'

describe Post do
  before {
    @post = Post.new
    @post.title = 'hello'
    @post.content = 'hello world'
  }

  subject { @post }

  describe 'creating a post' do
    it { should_not be_valid }

    its(:language) { should_not eq('en') }
    its(:author) { should eq(nil) }

    describe 'when the language is unknown' do
      before {
        @post.language = 'xxx'
      }
      it { should_not be_valid }
    end

    describe 'when the language is Japanese' do
      before {
        @post.language = 'ja'
        @post.author = FactoryGirl.create(:author)
      }
      it { should be_valid }

      it "shouldn't be overridden" do
        @post.save
        expect(Post.find(@post.id).language).to eq('ja')
      end
    end
  end

  describe 'languages' do
    describe 'all' do
      subject { Post.all_languages }
      it { should include('en') }
      it { should include('ja') }
    end

    describe 'used_languages' do
      it "doesn't return anything by default" do
        expect(Post.used_languages).to eq([])
      end

      it 'returns used languages in the database' do
        FactoryGirl.create(:japanese_post)
        expect(Post.used_languages).to eq(['ja'])

        FactoryGirl.create(:english_post)
        expect(Post.used_languages).to eq(['ja', 'en'])

        expect do
          FactoryGirl.create(:english_post)
        end.to(change(Post, :count).by(1))
        expect(Post.used_languages).to eq(['ja', 'en'])
      end
    end
  end
end
