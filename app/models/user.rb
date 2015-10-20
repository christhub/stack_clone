class User < ActiveRecord::Base
  has_many :questions
  has_many :answer
  has_many :votes, :as => :votable
  # has_one :vote, through: :answer
  # validates_presence_of :user
  # validates_presence_of :email

  attr_accessor :password
  validates_confirmation_of :password
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
