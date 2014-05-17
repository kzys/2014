module ApplicationHelper
  def flash_to_bootstrap(key)
      { 'notice' => 'info' }[key] || key.to_s
  end

  def link_to_post(title, post)
    created_at = post.created_at
    pairs = %w(year month day).map do |s|
      [ s.to_sym, created_at.send(s) ]
    end
    params = Hash[pairs]
    params[:id] = post.id

    params.delete(:year) if Blog14::YEARLY_BLOG

    link_to title, permalink_path(params)
  end

  def permalink(post)
    created_at = post.created_at
    pairs = %w(year month day).map do |s|
      [ s.to_sym, created_at.send(s) ]
    end
    params = Hash[pairs]
    params[:id] = post.id

    params.delete(:year) if Blog14::YEARLY_BLOG
    permalink_url(params)
  end
end
