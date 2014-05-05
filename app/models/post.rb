class Post < ActiveRecord::Base
  def self.all_languages
    Hash[
         ISO_639::ISO_639_1.map do |ary|
           [ ary[2], ary[3] ]
         end.select do |ary|
           ary.first != ''
         end
        ]
  end

  def self.used_languages
    Post.pluck('distinct language').select do |lang|
      lang
    end
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :language, inclusion: { in: all_languages.keys }

  belongs_to :author
  validates :author, presence: true

  after_initialize :set_default_values

  def content_html
    Kramdown::Document.new(self.content).to_html
  end

  private
  def set_default_values
    ;
  end
end
