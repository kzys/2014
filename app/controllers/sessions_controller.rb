class SessionsController < ApplicationController
  def create
    author = Author.find_by(email: params[:session][:email].downcase)
    if author and author.authenticate(params[:session][:password])
      flash[:success] = "Welcome #{author.name}"

      token = Author.create_remember_token
      cookies.permanent[:remember_token] = token
      author.update_attribute(:remember_token, Author.token_digest(token))
      self.current_author = author

      redirect_to new_post_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
