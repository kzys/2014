module SessionsHelper
  def current_author
    token = cookies.permanent[:remember_token]

    if token
      Author.find_by(remember_token: Author.token_digest(token))
    else
      nil
    end
  end

  def logout
    author = current_author

    if author
      token_digest = Author.token_digest(Author.create_remember_token)
      author.update_attribute(:remember_token, token_digest)
      cookies.delete(:remember_token)
    end
  end
end
