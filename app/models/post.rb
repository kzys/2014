class Post < ActiveRecord::Base
  belongs_to :author

  def content_html
    Kramdown::Document.new(self.content).to_html
  end
end
