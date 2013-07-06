class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  validates :password,  length: { minimum: 6 }
  validates :password,  presence:   true
  validates :email,     uniqueness: true
  validates :name,      presence:   true



end
