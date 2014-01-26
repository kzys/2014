xml.feed('xmlns' => 'http://www.w3.org/2005/Atom') do
  xml.updated(@posts.first.updated_at.xmlschema)

  # TODO
  xml.title('Blog14')
  xml.id(root_url)
  xml.link('rel' => 'self', 'href' => url_for(only_path: false, format: 'atom'))

  Author.all.each do |author|
    xml.author { xml.name(author.name) }
  end

  @posts.each do |post|
    xml.entry do
      xml.title(post.title)
      xml.updated(post.updated_at.xmlschema)
      xml.link('href' => permalink(post))
      xml.id(permalink(post))
      xml.content(post.content_html, 'type' => 'html')
    end
  end
end

