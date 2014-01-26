xml.feed('xmlns' => 'http://www.w3.org/2005/Atom') do
  xml.title('Blog14')

  Author.all.each do |author|
    xml.author { xml.name(author.name) }
  end

  @posts.each do |post|
    xml.entry do
      xml.title(post.title)
      xml.updated(post.updated_at)
      xml.link('href' => permalink(post))
      xml.id(permalink(post))
      xml.content do
        xml.cdata!(post.content_html)
      end
    end
  end
end

