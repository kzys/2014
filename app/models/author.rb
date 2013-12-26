class Author < ActiveRecord::Base
  has_many :posts

  def self.create_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.token_digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
