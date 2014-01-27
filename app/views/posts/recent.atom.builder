xml.feed('xmlns' => 'http://www.w3.org/2005/Atom') do
  xml.updated(@posts.first.created_at.xmlschema)

  # TODO
  xml.title('Blog14')
  xml.id(root_url)

  begin
    # params contain :controller, :action, ... but they are not required in
    # this context
    language = params[:language]
    known_params = if language
                     { language: language }
                   else
                     nil
                   end
    href = url_for(only_path: false, format: 'atom', params: known_params)
    xml.link('rel' => 'self', 'href' => href)
  end

  Author.all.each do |author|
    xml.author { xml.name(author.name) }
  end

  @posts.each do |post|
    xml.entry do
      xml.title(post.title)
      xml.updated(post.created_at.xmlschema)
      xml.link('href' => permalink(post))
      xml.id(permalink(post))
      xml.content(post.content_html, 'type' => 'html')
    end
  end
end
