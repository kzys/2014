class Post < ActiveRecord::Base
  CommonLanguages = Hash[
                         ISO_639::ISO_639_1.map do |ary|
                           [ ary[2], ary[3] ]
                         end.select do |ary|
                           ary.first != ''
                         end
                        ]
  validates :language, inclusion: { in: CommonLanguages.keys }

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
