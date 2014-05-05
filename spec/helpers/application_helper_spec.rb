require 'spec_helper'
require 'application_helper'

describe ApplicationHelper do
  describe 'permalink' do
    post = FactoryGirl.create(:english_post)
    d = post.created_at

    it { expect(permalink(post)).to match %r{/#{d.month}/#{d.day}/} }

    Post.delete_all
  end
end
