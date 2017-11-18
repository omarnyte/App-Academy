class User < ApplicationRecord
  validates :password, length: {minimum: 6, allow_nil: true }
  before_validation :ensure_session_token
  
  attr_reader :password
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.valid_password(password) ? user : nil
  end
  
  def valid_password(passsword) 
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    return self.session_token
  end
  
  def password=(password)
    @password = password
    pd = BCrypt::Password.create(password)
    self.password_digest = pd 
  end
  
  
end
