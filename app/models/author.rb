class Author < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :email, presence: true, format: { with: /@/ }

  def self.create_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.token_digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
