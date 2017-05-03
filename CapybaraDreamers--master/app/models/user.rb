class User < ApplicationRecord
  validates :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    if user.password_is?(password)
      user
    else
      flash[:errors] << "Wrong user!"
    end
  end

  def self.generate_token
    Random.new.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_is?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private

  def ensure_session_token
    @session_token ||= User.generate_token
  end
end
