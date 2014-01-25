class Post < ActiveRecord::Base
  CommonLanguages =
    Hash[ ISO_639::ISO_639_1.map { |ary| [ ary[0], ary[3] ] } ]
  validates :language, inclusion: { in: CommonLanguages.keys }

  belongs_to :author
  validates :author, presence: true

  after_initialize :set_default_values

  def content_html
    Kramdown::Document.new(self.content).to_html
  end

  private
  def set_default_values
    self.language ||= ISO_639.find_by_english_name('English').alpha3
  end
end
